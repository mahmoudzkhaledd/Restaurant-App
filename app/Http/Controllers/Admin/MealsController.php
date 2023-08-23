<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Restaurant;
use App\Models\Meal;


use function Laravel\Prompts\text;

class MealsController extends Controller
{


public function showMenuItems($restaurant_id)
{
    if($restaurant_id){
        $restaurant = Restaurant::find($restaurant_id);
        $menuItems = $restaurant->meals;
    
        // Pass the menu items to a view
        return view('restaurant.menu_items', compact('restaurant', 'menuItems'));
    }
    
    else{
        return text("there is no restaurant");
    }
}


public function updateMenuItem(Request $request, $restaurant_id, $meal_id)
{
    // Find the restaurant
    $restaurant = Restaurant::find($restaurant_id);

    // Find the menu item within the restaurant
    $menuItem = $restaurant->meals()->find($meal_id);

    if (!$menuItem) {
        // Handle not found case, return a response or redirect as needed
    }

    // Update menu item details based on the request data
    $menuItem->name = $request->input('name');
    $menuItem->description = $request->input('description');
    $menuItem->S_price = $request->input('S_price');
    $menuItem->M_price = $request->input('M_price');
    $menuItem->L_price = $request->input('L_price');
    // Update other menu item details as needed
  // Update the image path
  $meal = Meal::find($meal_id); // Retrieve the meal record by ID
  $meal->image = 'meals/bimg.jpg'; // Update the image path
  $meal->save(); // Save the changes
    $menuItem->save();

    // Redirect back to the menu items page with a success message
    return redirect()->route('restaurant.menu', $restaurant->id)->with('success', 'Menu item updated successfully.');
}


//dah hy show el meals kollaha
public function index($restaurantId)
{
    $meals = Meal::where('restaurant_id', $restaurantId)->get();

    return view('meals.index', ['meals' => $meals, 'restaurantId' => $restaurantId]);
}


//howa da el add meal
public function store(Request $request)
{
    // Validate the request data (including the 'image' field)
    $request->validate([
        'name' => 'required|string',
        'description' => 'required|string',
        'S_price' => 'required|numeric',
        'M_price' => 'required|numeric',
        'L_price' => 'required|numeric',
        'rating' => 'required|string',
        'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // Adjust validation rules as needed
    ]);

    // Handle the image upload and meal creation
    if ($request->hasFile('image')) {
        // Store the uploaded image and get the path
        $imagePath = $request->file('image')->store('meals', 'public');

        // Create a new meal record
        $meal = new Meal();
        $meal->restaurant_id = $request->input('restaurant_id');
        $meal->name = $request->input('name');
        $meal->description = $request->input('description');
        $meal->S_price = $request->input('S_price');
        $meal->M_price = $request->input('M_price');
        $meal->L_price = $request->input('L_price');
        $meal->rating = $request->input('rating');
        $meal->image = $imagePath; // Assign the image path

        // Save the meal record to the database
        $meal->save();

        return("meal added succefully");
    }

    // Handle the case where the image is not provided or the meal creation fails

    // Redirect or return an error response
}


//da el add meal
public function create(Restaurant $restaurant)
{
    $restaurantId = $restaurant->id; // Get the restaurant ID

    return view('meals.create', compact('restaurantId', 'restaurant'));
}



    public function getMeal(){
        //NOT IMPLEMENTED YET
    }
    public function addMeals(){
        //NOT IMPLEMENTED YET
        
    }
    public function deleteMeal(){
        //NOT IMPLEMENTED YET
        
    }
    
}
