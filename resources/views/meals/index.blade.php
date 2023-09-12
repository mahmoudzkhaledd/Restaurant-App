@extends('layouts.app')

@section('content')
<div class="container" style="background-color: beige">
    <h1>Meals for Restaurant {{ $restaurantId }}</h1>

    @if (count($meals) > 0)
    <ul class="list-group">
        @foreach ($meals as $meal)
        <li class="list-group-item">
            <div class="d-flex justify-content-between align-items-center">
                <h3>{{ $meal->name }}</h3>
                <span class="badge badge-primary badge-pill">{{ $meal->rating }}</span>
            </div>
            <p class="mb-0">{{ $meal->description }}</p>
            <p>Price (S): ${{ $meal->S_price }}</p>
            <p>Price (M): ${{ $meal->M_price }}</p>
            <p>Price (L): ${{ $meal->L_price }}</p>
            <img src="{{ asset('storage/' . $meal->image) }}" alt="{{ $meal->name }}" class="img-fluid mt-3" style="max-height: 200px;">
            
                <!-- Inside your menu.blade.php -->
                <form action="{{ route('menu.add-to-cart', ['restaurant_id' => $restaurantId]) }}" method="POST">
                    @csrf
                    <input type="hidden" name="id" value="{{ $meal->id }}">
                    <input type="number" name="quantity" value="1" min="1">
                    <button type="submit">Add to Cart</button>
                </form>
                

        </li>
        <br>
        @endforeach
        
    </ul>
    <a href="{{ route('meals.create', ['restaurant' => $restaurantId]) }}">Add Meal</a>

    @else
    
    <p>No meals available for this rest</p>
    @endif
</div>
@endsection
