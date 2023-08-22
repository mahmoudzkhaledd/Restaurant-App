<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Meal extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'restaurant_id',
        'S price',
        'M price',
        'L price',
        'rating',
        'image',
        'description',
    ];
}
