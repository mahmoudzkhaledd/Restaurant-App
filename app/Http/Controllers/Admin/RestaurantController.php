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

    
    public function store(Request $request)
    {
        // Validate the image upload
        $request->validate([
            'logo' => 'image|mimes:jpeg,png,jpg,gif|max:2048', // Example validation for image file
            // Add validation rules for other form fields here
        ]);
    
        // Handle the image upload
        if ($request->hasFile('logo')) {
            $logoPath = $request->file('logo')->store('restaurant_logos', 'public');
    
            // Create a new restaurant record with the file path in the 'logo' column
            $restaurant = new Restaurant();
            $restaurant->logo = $logoPath;
    
            // Set other restaurant data from the form
            $restaurant->name = $request->input('name');
            $restaurant->location = $request->input('location');
            $restaurant->description = $request->input('description');
            $restaurant->rating = $request->input('rating');
            $restaurant->contact_details = $request->input('contact_details');
            $restaurant->cuisine_type = $request->input('cuisine_type');
            $restaurant->email = $request->input('email');
            $restaurant->password = bcrypt($request->input('password'));
    
            // Save the restaurant record to the database
            $restaurant->save();
        }
    
        // Redirect or return a response to indicate successful creation
    }
    

    public function edit($id)
    {
        // Find the restaurant by ID
        $restaurant = Restaurant::findOrFail($id);
    
        // Load the edit profile view with the restaurant data
        return view('restaurant.edit', compact('restaurant'));
    }
    

    public function update(Request $request, $id)
    {
        // Get the authenticated restaurant
        $restaurant = Restaurant::find(auth()->user()->id);
    
        // Validate the form data
        $request->validate([
            // Validation rules
        ]);
    
        // Update the restaurant's profile information
        $restaurant->name = $request->input('name');
        $restaurant->location = $request->input('location');
        // ... Update other fields as needed
    
        // Save the changes
        $restaurant->save();
    
        // Redirect with a success message
        return redirect()->route('restaurant.profile')->with('success', 'Profile updated successfully');
    }
    
    public function search(Request $request)
{
    // Retrieve the search criteria from the form
    $location = $request->input('location');
    $cuisine = $request->input('cuisine');
    $minRating = $request->input('rating');
    $maxPrice = $request->input('L price');
    $minPrice = $request->input('S price');
    $ratings = $request->input('rating');

    // Add more criteria as needed

    // Build the query to search for restaurants
    $query = Restaurant::query();

    if ($location) {
        $query->where('location', 'like', '%' . $location . '%');
    }

    if ($cuisine) {
        $query->where('cuisine_type', 'like', '%' . $cuisine . '%');
    }

    if ($minRating) {
        $query->where('rating', '>=', $minRating);
    }
    
    if ($maxPrice) {
        $query->whereBetween('price', [$minPrice, $maxPrice]);
    }
    if ($ratings) {
        $query->where('rating', '>=', $ratings);
    }

    if ($request->has('delivery')) {
        $query->where('delivery', true);
    }
    

    // Add more query conditions for other criteria (e.g., price range, ratings)

    // Execute the query
    $restaurants = $query->get();

    // Pass the search results to the view
    return view('restaurant.index', ['restaurants' => $restaurants]);
}


public function showSearchForm()
{
    return view('search');
}



public function index()
{
    $restaurants = Restaurant::all(); 

    return ['restaurants' => $restaurants  ];

    // $new_rest = array_map(function($value) {

    //     return [
    //         'name' => $value['name'],
    //         'description' => $value['description'],
    //         'location' => $value['location'],
    //         'cusine_type'=>$value['cusine_type'],
    //         'contact'

    //     ];

    // }, $restaurants);
}

}
