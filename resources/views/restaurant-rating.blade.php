@php
    $restaurantRatingController = new \App\Http\Controllers\RestaurantRatingController();
    $averageRating = $restaurantRatingController->getAvgRating(request()->route('restaurant_id'));
@endphp

@extends('layouts.app')

@section('content')
    <div>
        <strong>
            Restaurant Rating
        </strong>

        Average Rating: {{ $averageRating }}

        <br>
        <br>

        <form method="POST" action="{{ route('add-restaurant-review', request()->route('restaurant_id')) }}">
            @csrf

            {{-- Restaurant rating --}}
            <div>
                <label for="rating">Restaurant Rating</label>
                <span>&nbsp;</span>
                <input type="number" name="rating" id="rating" min="1" max="5" required>
            </div>

            <br>

            {{-- Review --}}
            <div>
                <label for="review">Restaurant review</label>
                <span>&nbsp;</span>
                <textarea name="review" id="review"></textarea>
            </div>

            <br>

            {{-- Submit --}}
            <strong>
                <button type="submit" style="color: white; background-color:green; padding:0.3rem">
                    Submit
                </button>
            </strong>
        </form>
    </div>
@endsection
