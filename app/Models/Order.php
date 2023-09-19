<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    
    public function cart()
    {
        return $this->belongsTo(Cart::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }
    public function meals()
    {
        return $this->belongsToMany(Meal::class)->withPivot('quantity');
    }
}
