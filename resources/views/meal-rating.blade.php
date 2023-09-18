@php
    $mealRatingController = new \App\Http\Controllers\MealsRatingController();
    $averageRating = $mealRatingController->getAvgRating(request()->route('meal_id'));
@endphp

@extends('layouts.app')

@section('content')
    <div>
        <strong>
            Meal Rating
        </strong>

        Average Rating: {{ $averageRating }}

        <br>
        <br>

        <form method="POST" action="{{ route('add-meal-review', ['meal_id' => request()->route('meal_id'), 'restaurant_id' => request()->route('restaurant_id')]) }}">
            @csrf

            {{-- Restaurant rating --}}
            <div>
                <label for="rating">Meal Rating</label>
                <span>&nbsp;</span>
                <input type="number" name="rating" id="rating" min="1" max="5" required>
            </div>

            <br>

            {{-- Review --}}
            <div>
                <label for="review">Meal review</label>
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
