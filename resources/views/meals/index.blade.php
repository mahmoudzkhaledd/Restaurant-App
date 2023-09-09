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
            <form method="POST" action="{{ route('cart.add', ['restaurant' => $restaurantId, 'meal' => $meal->id]) }}">
                @csrf
                <input type="hidden" name="menu_item_id" value="{{ $meal->id }}">
                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input type="number" name="quantity" id="quantity" class="form-control" value="1" min="1">
                </div>
                <button type="submit" class="btn btn-primary">Add to Cart</button>
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
