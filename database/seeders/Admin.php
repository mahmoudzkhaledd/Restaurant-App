<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Str;


class Admin extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
         User::create([
            'name'=>'seif',
            'email'=>'seif@gmail.com',
            'is_admin'=> 0 ,
            'email_verified_at' => now(),
            'password' => 'seif', // password
            'remember_token' => Str::random(10),

        ]);
    }
}
