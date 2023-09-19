<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartMeal extends Model
{
    use HasFactory;
    protected $table = 'cart_meal'; 

    protected $fillable = [
        'cart_id', 
        'meal_id',
        'quantity',
        'status',
    ];
    public function meals()
{
    return $this->belongsToMany(Meal::class);
}

public function orders()
{
    return $this->belongsToMany(Order::class);
}
public function user()
{
    return $this->belongsTo(User::class);
}
public function meal()
{
    return $this->belongsTo(Meal::class);
}


}
