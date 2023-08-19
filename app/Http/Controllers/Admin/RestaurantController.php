<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
// use Illuminate\Http\Request;
use App\Models\Restaurant;
// use App\Models\Restaurant;



class RestaurantController extends Controller
{
    public function create(){
        return view('restaurant.create');
    }

    public function store(Request $request){
        // Validate the image upload
    $request->validate([
        'logo' => 'image|mimes:jpeg,png,jpg,gif|max:2048', // Example validation for image file
    ]);

    // Handle the image upload
    if ($request->hasFile('logo')) {
        $logoPath = $request->file('logo')->store('restaurant_logos', 'public');

        // Save the file path in the 'logo' column
        // $restaurant->logo = $logoPath;
    }

    // Save other restaurant data and store it in the database
    // $restaurant->name = $request->input('name');
    // $restaurant->location = $request->input('location');
    // $restaurant->description = $request->input('description');
    // $restaurant->rating = $request->input('rating');
    // $restaurant->contact_details = $request->input('contact_details');
    // $restaurant->cuisine_type = $request->input('cuisine_type');
    // $restaurant->email = $request->input('email');
    // $restaurant->password = bcrypt($request->input('password'));

    // // Save the restaurant record
    // $restaurant->save();

    }

    public function edit(){
        //
        
    }

    public function update(){
        //
        
    }
}
