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
       
        // $requestData = $request->json()->all();
    
        $requestData = $request->json()->all();
        // dd($requestData); 

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
    
        $restaurant->save();
        
        return response()->json(['status' => 'success'], 200);
    }
    
    

    public function edit($id)
    {
        $restaurant = Restaurant::findOrFail($id);
    
        return view('restaurant.edit', compact('restaurant'));
    }
    

    // public function update(Request $request, $id)
    // {
    //     $restaurant = Restaurant::find(auth()->user()->id);
    
    //     $request->validate([
    //     ]);
    
    //     // Update the restaurant's profile information
    //     $restaurant->name = $request->input('name');
    //     $restaurant->location = $request->input('location');
    //     // ... Update other fields as needed
    
    //     // Save the changes
    //     $restaurant->save();
    
    //     // Redirect with a success message
    //     return redirect()->route('restaurant.profile')->with('success', 'Profile updated successfully');
    // }
    
    public function search(Request $request)
    {
        $requestData = $request->json()->all();
        
        $query = Restaurant::query();
        
        if (isset($requestData['location'])) {
            $location = $requestData['location'];
            $query->where('location', 'like', '%' . $location . '%');
        }
    
        if (isset($requestData['minRating'])) {
            $minRating = $requestData['minRating'];
            $query->where('rating', '>=', $minRating);
        }
    
   
        $restaurants = $query->get();
    
        return response()->json(['restaurants' => $restaurants]);
    }
    
    

public function showSearchForm()
{
    return view('search');
}



public function index()
{
    $restaurants = Restaurant::all(); 

    return ['restaurants' => $restaurants];
}

}
