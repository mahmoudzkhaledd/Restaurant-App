<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Restaurant;
use App\Models\Meal;


use function Laravel\Prompts\text;

class MealsController extends Controller
{

    public function __construct(){
        $this->middleware('auth:api' , [
           'except' => [
            'index',
            'store'
           ]
           ]);
   }



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
   
    $meal = Meal::find($meal_id);
    
    if (!$meal) {
        return response()->json(['error' => 'Meal not found.'], 404);
    }

    $meal->name = $request->input('name');
    $meal->description = $request->input('description');
    $meal->S_price = $request->input('S_price');
    $meal->M_price = $request->input('M_price');
    $meal->L_price = $request->input('L_price');
    $meal->rating = $request->input('rating');

    // Save the updated meal
    $meal->save();

    return response()->json(['success' => 'Meal updated successfully.'], 200);
}


public function edit($restaurant_id, $meal_id)
{
    $restaurant = Restaurant::findOrFail($restaurant_id);

    $meal = Meal::findOrFail($meal_id);


    return view('meals.edit', [
        'restaurant' => $restaurant,
        'meal' => $meal,
    ]);
}



//dah hy show el meals kollaha
public function index(Request $request, $restaurantId)
{
    $meals = Meal::where('restaurant_id', $restaurantId)->get();

    return response()->json(['meals' => $meals, 'restaurantId' => $restaurantId], 200);
}



//howa da el add meal
public function store(Request $request)
{
    $request->validate([
        'name' => 'required|string',
        'description' => 'required|string',
        'S_price' => 'required|numeric',
        'M_price' => 'required|numeric',
        'L_price' => 'required|numeric',
        'rating' => 'required|string',
        'image' => 'required|image|mimes:jpeg,png,jpg,gif', 
    ]);

    if ($request->hasFile('image')) {
        $imagePath = $request->file('image')->store('meals', 'public');

        $meal = new Meal();
        $meal->restaurant_id = $request->input('restaurant_id');
        $meal->name = $request->input('name');
        $meal->description = $request->input('description');
        $meal->S_price = $request->input('S_price');
        $meal->M_price = $request->input('M_price');
        $meal->L_price = $request->input('L_price');
        $meal->rating = $request->input('rating');
        $meal->image = $imagePath; 

        $meal->save();

        return response()->json(['message' => 'Meal added successfully'], 200);
    }

    return response()->json(['error' => 'Image not provided'], 400);
}


//da el add meal
public function create(Restaurant $restaurant)
{
    $restaurantId = $restaurant->id; 

    return view('meals.create', compact('restaurantId', 'restaurant'));
}


    
}
