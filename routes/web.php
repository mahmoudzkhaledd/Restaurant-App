<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\MealsController;
use App\Http\Controllers\Admin\RestaurantController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

// Route::middleware(['auth', 'admin'])-> as('admin.')->prefix('admin')->group(function() {
//     Route::get('/' , [AdminController::class, 'index'])->name('index');
//     Route::resource('/meals',MealsController::class );
// });



Route::get('/restaurant/create', [RestaurantController::class, 'create'])->middleware(['auth', 'admin'])->name('restaurant.create');

Route::post('/restaurant/store', [RestaurantController::class, 'store'])->middleware(['auth', 'admin'])->name('restaurant.store');

Route::get('/restaurant/edit/{id}', [RestaurantController::class, 'edit'])->middleware(['auth', 'admin'])->name('restaurant.edit');





// Route::put('/restaurant/update/{id}', RestaurantController::class, 'update')->middleware('auth');

//get menu of restaurant with all its meals
// Route::get('/restaurants/{restaurant_id}/menu', [MealsController::class, 'showMenuItems'])->middleware('auth')->name('restaurant.menu_items');






Route::get('/restaurants/{restaurant_id}/menu/{meal_id}/edit', [MealsController::class, 'edit'])
    ->middleware(['auth', 'admin'])
    ->name('restaurant.menu.update');

Route::put('/restaurants/{restaurant_id}/menu/{meal_id}', [MealsController::class, 'updateMenuItem'])
->middleware(['auth', 'admin'])
->name('restaurant.menu.update');

// Route::get('/meals', [MealsController::class, 'index'])->name('meals.index');


Route::get('/restaurants/{restaurantId}/meals', [MealsController::class, 'index'])->middleware('auth')->name('meals.index');

//dah howa howa el meals bta3t specific rest
// Route::get('/restaurants/{restaurant_id}/menu', [MealsController::class, 'showMenuItems'])->middleware('auth')->name('restaurant.menu_items');


// Route::get('/restaurants/{restaurantId}/meals', [MealsController::class, 'index'])
//     ->middleware(['auth', 'admin'])
//     ->name('meals.index');




//create new meal
Route::post('/meals', [MealsController::class, 'store'])
    ->middleware(['auth', 'admin'])
    ->name('meals.store');

Route::get('/restaurants/{restaurant}/meals/create', [MealsController::class, 'create'])
    ->middleware(['auth', 'admin'])
    ->name('meals.create');



//searching era
//gets all restaurants
//DONE
Route::get('/restaurants/search', [RestaurantController::class, 'showSearchForm'])->name('restaurant.searchForm');
Route::post('/restaurants/search/found', [RestaurantController::class, 'search'])->name('restaurant.search');


//get all restaurants
//DONE
Route::get('/restaurants', [RestaurantController::class, 'index'])->name('restaurant.index');


//place orders
Route::get('/restaurants/{restaurant_id}/menu',[OrderController::class, 'showMenu'])->name('menu.show');
Route::post('/restaurants/{restaurant_id}/menu', [OrderController::class, 'addToCart'])->name('menu.add-to-cart');
Route::get('/cart', [OrderController::class, 'showCart'])->name('cart.show');
Route::post('/cart/checkout', [OrderController::class, 'checkout'])->name('cart.checkout');
Route::post('/cart/add/{meal}', [OrderController::class, 'addToCart'])->name('cart.add');



Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
