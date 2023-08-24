<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\MealsController;
use App\Http\Controllers\Admin\RestaurantController;
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


Route::get('/restaurants/{restaurant_id}/menu', [MealsController::class, 'showMenuItems'])->middleware('auth')->name('restaurant.menu_items');



Route::put('/restaurants/{restaurant_id}/menu/{meal_id}', [MealsController::class, 'updateMenuItem'])
    ->middleware(['auth', 'is_admin'])
    ->name('restaurant.menu.update');

Route::get('/restaurants/{restaurantId}/meals', [MealsController::class, 'index'])
    ->middleware(['auth', 'is_admin'])
    ->name('meals.index');

Route::post('/meals', [MealsController::class, 'store'])
    ->middleware(['auth', 'is_admin'])
    ->name('meals.store');

Route::get('/restaurants/{restaurant}/meals/create', [MealsController::class, 'create'])
    ->middleware(['auth', 'is_admin'])
    ->name('meals.create');

//searching era
//gets all restaurants
Route::get('/restaurants', [RestaurantController::class, 'index'])->name('restaurant.index');

Route::get('/restaurants/search', [RestaurantController::class, 'showSearchForm'])->name('restaurant.searchForm');
Route::post('/restaurants/search', [RestaurantController::class, 'search'])->name('restaurant.search');





Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
