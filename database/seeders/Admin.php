<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Meal;

use Illuminate\Support\Str;


class Admin extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //  User::create([
        //     'name'=>'seif',
        //     'email'=>'seif@gmail.com',
        //     'is_admin'=> 0 ,
        //     'email_verified_at' => now(),
        //     'password' => 'seif', // password
        //     'remember_token' => Str::random(10),

        // ]);

        Meal::create([
            'name'=>'Normal Burger',
            'restaurant_id'=>'1',
            'S_price'=>'60',
            'M_price'=>'70',
            'L_price'=>'90',
            'rating'=>'9',
            'image'=>'bimg.jpg',
            'description'=>"gooood",
        ]);
    }
}
