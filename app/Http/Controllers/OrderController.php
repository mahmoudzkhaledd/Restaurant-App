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

    $cart = Cart::where('user_id', auth()->user()->id)->first(); // Get the user's cart

    if (!$cart) {
        $cart = new Cart(); // Create a new cart if none exists for the user
        $cart->user_id = auth()->user()->id;
        $cart->save();
    }

    $cart->meals()->attach($menuItem->id, ['quantity' => $request->input('quantity')]);

    return redirect()->route('cart.show')->with('success', 'Item added to cart.');
}


public function showCart()
{
    // Retrieve and display the user's cart items
    $cartItems = Cart::where('user_id', auth()->user()->id)->with('meals')->first();

    if (!$cartItems) {
        $cartItems = [];
    } else {
        $cartItems = $cartItems->meals;
    }

    // $cartTotal = $cartItems->sum(function ($cartItem) {
    //     return $cartItem->menuItem->S_price * $cartItem->quantity;
    // });

    return view('cart', ['cartItems' => $cartItems]);
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
