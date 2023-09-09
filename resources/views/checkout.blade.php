@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>Checkout</h1>

        @if(count($cartItems) > 0)
            <form method="POST" action="{{ route('cart.place-order') }}">
                @csrf

                <!-- Add checkout form fields here, e.g., shipping address, payment info -->

                <button type="submit" class="btn btn-primary">Place Order</button>
            </form>
        @else
            <p>Your cart is empty. Please add items before proceeding to checkout.</p>
        @endif
    </div>
@endsection
