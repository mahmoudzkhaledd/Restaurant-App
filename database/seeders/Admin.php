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
        //     'name'=>'test',
        //     'email'=>'test@gmail.com',
        //     'is_admin'=> 0 ,
        //     'email_verified_at' => now(),
        //     'password' => 'test', // password
        //     'remember_token' => Str::random(10),

        // ]);

        Meal::create([
            'name'=>'Smash Burger',
            'restaurant_id'=>'1',
            'S price'=>'70',
            'M price'=>'80',
            'L price'=>'100',
            'rating'=>'10',
            'description'=>"very good",
        ]);
    }
}
