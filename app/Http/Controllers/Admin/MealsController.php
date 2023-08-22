<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Restaurant;

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

    $menuItem->save();

    // Redirect back to the menu items page with a success message
    return redirect()->route('restaurant.menu', $restaurant->id)->with('success', 'Menu item updated successfully.');
}


    public function getMeal(){
        
    }
    
}
