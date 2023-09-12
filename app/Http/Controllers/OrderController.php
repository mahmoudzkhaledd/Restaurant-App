<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Meal;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function showMenu($restaurantId)
    {
        $meals = Meal::where('restaurant_id', $restaurantId)->get();
        return view('meals.index',  ['meals' => $meals, 'restaurantId' => $restaurantId] );
    }

    public function index($restaurantId)
{
    $meals = Meal::where('restaurant_id', $restaurantId)->get();

    return view('meals.index', ['meals' => $meals, 'restaurantId' => $restaurantId]);
}

public function addToCart(Request $request, $restaurant_id)
{
    $menuItem = Meal::find($request->input('id'));

    if (!$menuItem) {
        return redirect()->back()->with('error', 'Menu item not found.');
    }

    $cart = Cart::updateOrCreate(
        [
            'user_id' => auth()->user()->id,
            'meal_items' => $menuItem->name,
        ],
        [
            'quantity' => $request->input('quantity'),
        ]
    );

    dd($cart);

    return redirect()->route('cart.show')->with('success', 'Item added to cart.');
}




    


    public function showCart()
    {
        // $cartItems = Cart::where('user_id', auth()->user()->id)->with('menuItem')->get();
        $cartItems = Cart::where('user_id', auth()->user()->id)->with('meal')->get();

        return view('cart', ['cartItem' => $cartItems]);
    }

    public function checkout(Request $request)
    {
        Cart::where('user_id', auth()->user()->id)->delete();


        return redirect()->route('cart.show')->with('success', 'Order placed successfully.');
    }




    // public function index($restaurantId)
    // {
    //     $meals = Meal::where('restaurant_id', $restaurantId)->get();

    //     return view('meals.index', ['meals' => $meals, 'restaurantId' => $restaurantId]);
    // }
}
