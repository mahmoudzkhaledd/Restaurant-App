<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Meal;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;

class OrderController extends Controller
{
    // Protected routes with authentication middleware
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function showMenu($restaurantId)
    {
        $meals = Meal::where('restaurant_id', $restaurantId)->get();
        return view('meals.index',  ['meals' => $meals, 'restaurantId' => $restaurantId] );
    }

    public function addToCart(Request $request, $restaurant_id)
    {
        // Validate quantity input here if necessary
    
        $menuItem = Meal::find($request->input('id'));
        // dd($menuItem);
        if (!$menuItem) {
            return redirect()->back()->with('error', 'Menu item not found.');
        }
    
        // Add the menu item to the user's cart
        $cart = Cart::updateOrCreate(
            [
                'user_id' => auth()->user()->id,
                'menu_item_id' => $menuItem->id,
            ],
            [
                'quantity' => $request->input('quantity'),
            ]
        );
    
        return redirect()->route('cart')->with('success', 'Item added to cart.');
    }
    


    public function showCart()
    {
        // Retrieve and display the user's cart items
        $cartItems = Cart::where('user_id', auth()->user()->id)->with('menuItem')->get();
        return view('cart', ['cartItems' => $cartItems]);
    }

    public function checkout(Request $request)
    {
        // Validate and process the checkout, handle payment, and store order details
        // Use a payment gateway library (e.g., Stripe, PayPal) to handle payments

        // After successful payment and order placement, clear the user's cart
        Cart::where('user_id', auth()->user()->id)->delete();

        // You can also send an email confirmation to the user

        return redirect()->route('cart.show')->with('success', 'Order placed successfully.');
    }




    // public function index($restaurantId)
    // {
    //     $meals = Meal::where('restaurant_id', $restaurantId)->get();

    //     return view('meals.index', ['meals' => $meals, 'restaurantId' => $restaurantId]);
    // }
}
