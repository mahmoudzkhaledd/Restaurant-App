<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('cart_meal', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('cart_id');
            $table->unsignedBigInteger('meal_id');
            $table->integer('quantity')->default(1);
            $table->timestamps();
    
            $table->foreign('cart_id')->references('id')->on('carts')->onDelete('cascade');
            $table->foreign('meal_id')->references('id')->on('meals')->onDelete('cascade');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('cart_meal');
    }
};
