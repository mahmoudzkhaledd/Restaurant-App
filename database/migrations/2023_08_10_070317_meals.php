<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
{
    Schema::create('meals', function (Blueprint $table) {
        $table->id();
        $table->string('name');
        $table->foreignId('restaurant_id')->constrained('restaurants');
        $table->string('S price');
        $table->string('M price');
        $table->string('L price');
        $table->string('rating');
        $table->string('image');
        $table->longText('description');
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
