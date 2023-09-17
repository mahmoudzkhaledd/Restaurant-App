<?php

namespace App\Http\Controllers;

use App\Models\MealsRating;
use Illuminate\Http\Request;

class MealsRatingController extends Controller
{
    public function display()
    {
        return view('meal-rating');
    }

    public function addReview(Request $request, $restaurant_id, $meal_id)
    {
        $rating = new MealsRating();

        $rating->user_id = auth()->user()->getAuthIdentifier();
        $rating->meal_id = $meal_id;
        $rating->rating = $request->input('rating');
        $rating->review = $request->input('review');
        $rating->save();

        return("Rating added successfully!");
    }
}
