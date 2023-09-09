@extends('layouts.app')

@section('content')
<div class="container" style="background-color: aqua">
    <h1>Your Shopping Cart</h1>

    @if ($cartItems->isEmpty())
    <p>Your cart is empty.</p>
    @else
    <table class="table">
        <thead>
            <tr>
                <th>Item</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($cartItems as $cartItem)
            <tr>
                <td>{{ $cartItem->menuItem->name }}</td>
                <td>{{ $cartItem->quantity }}</td>
                <td>${{ $cartItem->menuItem->S_price }}</td>
                <td>${{ $cartItem->quantity * $cartItem->menuItem->S_price }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <div class="text-right">
        <h4>Total: ${{ $cartTotal }}</h4>
    </div>

    <form method="POST" action="{{ route('cart.checkout') }}">
        @csrf
        <button type="submit" class="btn btn-primary">Checkout</button>
    </form>
    @endif
</div>
@endsection
