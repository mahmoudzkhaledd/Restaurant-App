<!-- resources/views/search.blade.php -->

@extends('layouts.app')

@section('content')
<div class="container" style="background-color:beige">
    <h1>Search Restaurants</h1>

    <form method="POST" action="{{ route('restaurant.search') }}">
        @csrf

        <!-- Location -->
        <div class="form-group">
            <label for="location">Location</label>
            <input type="text" name="location" id="location" class="form-control">
        </div>

        <!-- Cuisine -->
        <div class="form-group">
            <label for="cuisine">Cuisine</label>
            <input type="text" name="cuisine" id="cuisine" class="form-control">
        </div>

        <!-- Price Range -->
        <div class="form-group">
            <label for="price_range">Price Range</label>
            <input type="text" name="price_range" id="price_range" class="form-control">
        </div>
        <!-- Ratings -->
        <div class="form-group">
            <label for="ratings">Ratings</label>
            <select name="ratings" id="ratings" class="form-control">
                <option value="5">5 Stars</option>
                <option value="4">4 Stars</option>
                <option value="3">3 Stars</option>
                <option value="2">2 Stars</option>
                <option value="1">1 Star</option>
            </select>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary">Search</button>
        </div>

    </form>
</div>
@endsection
