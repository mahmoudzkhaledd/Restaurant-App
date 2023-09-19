<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\RestaurantController;
use App\Http\Controllers\MealsRatingController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\RestaurantRatingController;
use App\Http\Controllers\TableController;
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

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware(['auth', 'admin'])-> as('admin.')->prefix('admin')->group(function() {
    Route::get('/' , [AdminController::class, 'index'])->name('index');
    Route::resource('/meals',MealsController::class );
});

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

Route::get('/restaurants/search', [RestaurantController::class, 'showSearchForm'])->name('restaurant.searchForm');
Route::post('/restaurants/search', [RestaurantController::class, 'search'])->name('restaurant.search');


//get all restaurants
Route::get('/restaurants', [RestaurantController::class, 'index'])->name('restaurant.index');


//place orders
Route::get('/restaurants/{restaurant_id}/menu',[OrderController::class, 'showMenu'])->name('menu.show');
// Route::post('/restaurants/{restaurant_id}/menu/f', [OrderController::class, 'addToCart'])->name('menu.add-to-cart');
Route::post('/restaurants/{restaurant_id}/menu', [OrderController::class, 'addToCart'])->name('menu.add-to-cart');

Route::get('/cart', [OrderController::class, 'showCart'])->name('cart.show');
Route::post('/cart/checkout', [OrderController::class, 'checkout'])->name('cart.checkout');
Route::post('/cart/add/{meal}', [OrderController::class, 'addToCart'])->name('cart.add');



Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


// Ratings & Reviews
// 1. For a Restaurant
Route::get('/restaurants/{restaurant_id}/rate', [RestaurantRatingController::class, 'display'])
->middleware(['auth'])
->name('restaurant-rating.display');

Route::post('/restaurants/{restaurant_id}/add-review', [RestaurantRatingController::class, 'addReview'])
->middleware(['auth'])
->name('add-restaurant-review');

Route::get('/restaurants/{restaurant_id}/avarage-rating', function ($restaurant_id) {
    $controller = new RestaurantRatingController();
    return $controller->getAvgRating($restaurant_id);
});


// 2. For a Meal
Route::get('/restaurants/{restaurant_id}/menu/{meal_id}/rate', [MealsRatingController::class, 'display'])
->middleware(['auth'])
->name('meal-rating.display');

Route::post('/restaurants/{restaurant_id}/menu/{meal_id}/add-review', [MealsRatingController::class, 'addReview'])
->middleware(['auth'])
->name('add-meal-review');

Route::get('/restaurants/{restaurant_id}/menu/{meal_id}/avarage-rating', function ($restaurant_id , $meal_id) {
    $controller = new MealsRatingController();
    return $controller->getAvgRating($meal_id);
});



// Table Reservation
// Adding a Table
Route::get('/restaurants/{restaurant_id}/add-table', [TableController::class, 'create'])
->middleware(['auth', 'admin'])
->name('table.add');

Route::post('/restaurants/{restaurant_id}/store-table', [TableController::class, 'store'])
->middleware(['auth', 'admin'])
->name('table.store');


// Making a Reservation
Route::get('/restaurants/{restaurant_id}/reservation', [ReservationController::class, 'create'])
->middleware(['auth'])
->name('reservation');

Route::post('/restaurants/{restaurant_id}/reservation/tables', [ReservationController::class, 'to_tables'])
->middleware(['auth'])
->name('choose.table');

Route::post('/restaurants/{restaurant_id}/reservation.saved', [ReservationController::class, 'store'])
->middleware(['auth'])
->name('reservation.add');

require __DIR__.'/auth.php';
