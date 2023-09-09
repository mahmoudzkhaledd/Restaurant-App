<?php

namespace App\Models;
// namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Restaurant extends Model
{
    protected $fillable = [
        'name',
        'location',
        'logo',
        'description',
        'rating',
        'contact_details',
        'cuisine_type',
        'email',
        'password',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function meals()
{
    return $this->hasMany(Meal::class);
}


    // Add any additional model logic or relationships here
}
