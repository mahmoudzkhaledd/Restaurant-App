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

    $cart = Cart::where('user_id', auth()->user()->id)->first(); 

    if (!$cart) {
        $cart = new Cart(); 
        $cart->user_id = auth()->user()->id;
        $cart->save();
    }

    $cart->meals()->attach($menuItem->id, ['quantity' => $request->input('quantity')]);

    return redirect()->route('cart.show')->with('success', 'Item added to cart.');
}
    
public function addToOrder(Request $request, $restaurant_id)
{
    $menuItem = Meal::find($request->input('id'));

    if (!$menuItem) {
        return redirect()->back()->with('error', 'Menu item not found.');
    }

    $user = auth()->user();

    $order = Order::where('user_id', $user->id)->where('status', 'cart')->first();

    if (!$order) {
        $order = new Order([
            'user_id' => $user->id,
            'restaurant_id' => $restaurant_id,
            'status' => 'cart',
        ]);

        $order->save();
    }

    $order->meals()->attach($menuItem->id, ['quantity' => $request->input('quantity')]);

    return redirect()->route('cart.show')->with('success', 'Item added to order.');
}

public function showOrder()
{
    $user = auth()->user();
    $order = Order::where('user_id', $user->id)->where('status', 'cart')->with('meals')->first();

    $orderItems = $order ? $order->meals : [];

    return view('order', ['orderItems' => $orderItems]);
}


public function showCart()
{
    $user_id = auth()->user()->id;
    $cartItems = Cart::where('user_id', $user_id)->with('meals')->first();


    // $cartItems = Cart::where('user_id', $user_id)->with('menuItem')->get();

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
public function showOrderHistory()
{
    $user_id = auth()->user()->id;

    $orders = DB::table('cart_meal')
        ->join('carts', 'cart_meal.cart_id', '=', 'carts.id')
        ->join('meals', 'cart_meal.meal_id', '=', 'meals.id')
        ->where('carts.user_id', $user_id)
        ->select('meals.*', 'cart_meal.status', 'cart_meal.created_at as order_time')
        ->get();

    return view('history', ['orders' => $orders]);
}


public function orderTracking()
{
    $userId = auth()->user()->id;

    $carts = Cart::where('user_id', $userId)->get();

    $pendingOrders = collect([]);

    foreach ($carts as $cart) {
        $orders = $cart->meals()->wherePivot('status', 'pending')->get();
        $pendingOrders = $pendingOrders->merge($orders);
    }

    // Calculate time remaining for each order in progress
    foreach ($pendingOrders as $order) {
        if ($order->pivot->created_at) {
            // Calculate the time remaining until one hour from order creation(estimated en koll order gdeed ya5od 1 hour pending then accepted msln)
            $createdAt = $order->pivot->created_at;
            $oneHourLater = $createdAt->addHours(1);
            $now = now();
            $timeRemaining = $now->diffForHumans($oneHourLater);
    
            $order->timeRemaining = $timeRemaining;
        }
    }
    

    return view('tracking', ['pendingOrders' => $pendingOrders]);
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
