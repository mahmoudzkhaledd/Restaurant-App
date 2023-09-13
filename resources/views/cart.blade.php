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
                <td>{{ $cartItem->name }}</td>
                <td>{{ $cartItem->pivot->quantity }}</td>
                <td>${{ $cartItem->S_price }}</td>
                <td>${{ $cartItem->S_price * $cartItem->pivot->quantity }}</td>
            </tr>
        @endforeach
        
        
        </tbody>
    </table>
{{-- 
    <div class="text-right">
        <h4>Total: ${{ $cartTotal }}</h4>
    </div> --}}


    <form method="POST" action="{{ route('cart.checkout') }}">
        @csrf
        <button type="submit" class="btn btn-primary">Checkout</button>
    </form>
    @endif
</div>
@endsection
