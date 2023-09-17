<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MealsRating extends Model
{
    use HasFactory;
    protected $table = 'meals_rating';

    protected $primaryKey = 'id';
    protected $fillable = [
        'user_id',
        'meal_id',
        'rating',
        'review',
    ];
}
