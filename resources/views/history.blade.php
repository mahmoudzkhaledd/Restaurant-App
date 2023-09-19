@extends('layouts.app')

@section('content')
    <h1 style="background-color:aqua">Order History</h1>

    @if($orders->isEmpty())
        <p style="background-color:aqua">You haven't placed any orders yet.</p>
    @else
        <table class="table" style="background-color:aqua">
            <thead>
                <tr>
                    <th>Order ID</th>
                    {{-- <th>Total Price</th> --}}
                    <th>Status</th>
                    {{-- <th>Action</th> --}}
                </tr>
            </thead>
            <tbody>
                @foreach ($orders as $order)
                    <tr>
                        <td>{{ $order->id }}</td>
                        
                        {{-- <td>${{ $order->total_price }}</td> --}}
                        <td>{{ $order->status }}</td>
                        <td>
                            {{-- <a href="{{ route('orders.tracking', ['order_id' => $order->id]) }}">Track Order</a> --}}
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif
@endsection
