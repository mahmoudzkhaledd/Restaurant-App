@extends('layouts.app')

@section('content')
<div class="container" style="background-color: brown">
    <h1>Add New Meal for Restaurant {{ $restaurantId }}</h1>

    <form method="POST" action="{{ route('meals.store', ['restaurantId' => $restaurantId]) }}" enctype="multipart/form-data">
        @csrf

        <!-- Restaurant ID (Hidden Field) -->
        <input type="hidden" name="restaurant_id" value="{{ $restaurant->id }}">

        <!-- Meal Name -->
        <div class="form-group">
            <label for="name">Meal Name</label>
            <input type="text" name="name" id="name" class="form-control" required>
        </div>

        <!-- Description -->
        <div class="form-group">
            <label for="description">Description</label>
            <textarea name="description" id="description" class="form-control" required></textarea>
        </div>
<!-- Price -->
<!-- S_price -->
<div class="form-group">
    <label for="S_price">Price (S)</label>
    <input type="text" name="S_price" id="S_price" class="form-control" required>
</div>

<div class="form-group">
    <label for="M_price">Price (M)</label>
    <input type="text" name="M_price" id="M_price" class="form-control" placeholder="M Price" required>
</div>
<div class="form-group">
    <label for="L_price">Price (L)</label>
    <input type="text" name="L_price" id="L_price" class="form-control" placeholder="L Price" required>
</div>


        <!-- Rating -->
        <div class="form-group">
            <label for="rating">Rating</label>
            <input type="text" name="rating" id="rating" class="form-control" required>
        </div>

        <!-- Image Upload -->
        <div class="form-group">
            <label for="image">Meal Image</label>
            <input type="file" name="image" id="image" class="form-control-file" accept="image/*" required>
        </div>  

        <div class="form-group">
            <button type="submit" class="btn btn-primary">Add Meal</button>
        </div>
    </form>
</div>
@endsection
