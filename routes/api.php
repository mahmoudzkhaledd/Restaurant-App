<?php

use App\Http\Controllers\Admin\RestaurantController;
use App\Http\Controllers\Admin\MealsController;

use App\Http\Controllers\Api\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('register' , [AuthController::class ,'register']);
Route::post('login' , [AuthController::class , 'login']);
Route::get('rest', [RestaurantController::class , 'index']);
Route::post('/restaurant/store', [RestaurantController::class, 'store']);
Route::get('/restaurants/{restaurantId}/meals', [MealsController::class, 'index']);
Route::put('/restaurants/{restaurant_id}/menu/{meal_id}', [MealsController::class, 'updateMenuItem']);
Route::post('/meals', [MealsController::class, 'store']);
Route::post('/restaurants/search/found', [RestaurantController::class, 'search']);

