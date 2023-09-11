<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
// use Illuminate\Http\Request;
use App\Models\Restaurant;
// use App\Models\Restaurant;



class RestaurantController extends Controller
{
    
    public function __construct(){
        $this->middleware('auth:api' , [
           'except' => [
               'index', 
            'search',
            'showSearchForm',
            'store',
            'edit',
            'update'
           ]
           ]);
   }

    public function create(){
        return view('restaurant.create');
    }

    
    public function store(Request $request)
    {
        // 1. Receive JSON Request (Make sure you're sending the request as JSON)
        // 2. Parse JSON and Validate
        // $requestData = $request->json()->all();
    
        $requestData = $request->json()->all();
        // dd($requestData); 

        // Example validation for required fields
        $request->validate([
            'name' => 'required',
            'location' => 'required',
            'description' => 'required',
            'rating' => 'required|numeric',
            'contact_details' => 'required',
            'cuisine_type' => 'required',
            'email' => 'required|email|unique:restaurants',
            'password' => 'required',
        ]);
    
        // 3. Handle Image Upload (if included in the JSON request)
        // 4. Create Restaurant
        $restaurant = new Restaurant();
        $restaurant->logo = $requestData['logo'] ?? null;
        $restaurant->name = $requestData['name'];
        $restaurant->location = $requestData['location'];
        $restaurant->description = $requestData['description'];
        $restaurant->rating = $requestData['rating'];
        $restaurant->contact_details = $requestData['contact_details'];
        $restaurant->cuisine_type = $requestData['cuisine_type'];
        $restaurant->email = $requestData['email'];
        $restaurant->password = bcrypt($requestData['password']);
    
        // 5. Save Restaurant and Return JSON Response
        $restaurant->save();
        
        return response()->json(['status' => 'success'], 200);
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
        // Retrieve the search criteria from the JSON request
        $requestData = $request->json()->all();
        
        // Build the query to search for restaurants
        $query = Restaurant::query();
        
        // Check if a location is provided
        if (isset($requestData['location'])) {
            $location = $requestData['location'];
            $query->where('location', 'like', '%' . $location . '%');
        }
    
        // Add more conditions for other criteria as needed
        // For example, if 'minRating' is provided:
        if (isset($requestData['minRating'])) {
            $minRating = $requestData['minRating'];
            $query->where('rating', '>=', $minRating);
        }
    
        // Continue adding conditions for other criteria
        
        // Execute the query
        $restaurants = $query->get();
    
        // Return the search results as JSON
        return response()->json(['restaurants' => $restaurants]);
    }
    
    

public function showSearchForm()
{
    return view('search');
}



public function index()
{
    $restaurants = Restaurant::all(); // Assuming you have a "Restaurant" model

    return ['restaurants' => $restaurants];
}

}
