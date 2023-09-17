<?php

namespace App\Http\Controllers;

use App\Models\restaurant_rating;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class RestaurantRatingController extends Controller
{
    public function display()
    {
        return view('restaurant-rating');
    }

    public function addReview(Request $request, $restaurant_id)
    {
        $rating = new restaurant_rating();

        $rating->user_id = auth()->user()->getAuthIdentifier();
        $rating->restaurant_id = $restaurant_id;
        $rating->rating = $request->input('rating');
        $rating->review = $request->input('review');
        $rating->save();

        return("Rating added successfully!");
    }
}
