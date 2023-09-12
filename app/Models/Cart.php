<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 
        'meal_items',

    ];
  

    
    public function meal()
    {
        return $this->belongsTo(Meal::class, 'meal_items');
    }
    
    public function meals()
    {
        return $this->hasMany(Meal::class);
    }
}
