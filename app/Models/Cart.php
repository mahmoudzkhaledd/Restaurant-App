<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    // public function meals()
    // {
    //     return $this->hasMany(Meal::class);
    // }
    protected $fillable = [
        'user_id', 
        'meal_items',


    ];
    protected $casts = [
        'meal_items' => 'json'
    ];
    
    public function meals()
    {
        return $this->belongsToMany(Meal::class);
    }

    
    public function meal()
    {
        return $this->belongsTo(Meal::class, 'meal_items');
    }
}
