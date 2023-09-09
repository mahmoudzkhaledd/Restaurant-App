<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Meal extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $primaryKey = 'id'; // Ensure that 'id' is the correct primary key column
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
