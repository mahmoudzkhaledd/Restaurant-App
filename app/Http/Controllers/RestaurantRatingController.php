<?php

namespace App\Http\Controllers;

use App\Models\restaurant_rating;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

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

    public function getAvgRating($restaurant_id)
    {
        return DB::table('restaurant_ratings')->where('restaurant_id', $restaurant_id) ->avg('rating');
    }
}
