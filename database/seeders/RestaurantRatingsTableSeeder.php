<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\restaurant_rating;

class RestaurantRatingsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $ratings = [
            ['id'=> 1, 'user_id'=> 1, 'restaurant_id'=>3, 'rating'=>5, 'review'=>'L mat3am da mya mya w L nas zy el fol'],
            ['id'=> 2, 'user_id'=> 1, 'restaurant_id'=>4, 'rating'=>1, 'review'=>'L ta3mia Mizayta w 7aga te2ref'],
        ];

        restaurant_rating::insert($ratings);
    }
}
