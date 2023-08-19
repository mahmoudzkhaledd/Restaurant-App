@extends('layouts.app') <!-- Assuming you have a layout file for your app -->

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Create Restaurant Profile</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('restaurant.store') }}" enctype="multipart/form-data">
                        @csrf

                        <!-- Restaurant Name -->
                        <div class="form-group">
                            <label for="name" style="color:red">Restaurant Name</label>
                            <input type="text" name="name" id="name" class="form-control" required>
                        </div>

                        <!-- Location -->
                        <div class="form-group">
                            <label for="location" style="color:red">Location</label>
                            <textarea name="location" id="location" class="form-control" required></textarea>
                        </div>

                        <!-- Logo -->
                        <div class="form-group">
                            <label for="logo" style="color:red">Restaurant Logo</label>
                            <input type="file" name="logo" id="logo" class="form-control-file" accept="image/*" required>
                        </div>

                        <!-- Description -->
                        <div class="form-group">
                            <label for="description" style="color:red">Description</label>
                            <textarea name="description" id="description" class="form-control" required></textarea>
                        </div>

                        <!-- Rating -->
                        <div class="form-group">
                            <label for="rating" style="color:red">Rating</label>
                            <input type="text" name="rating" id="rating" class="form-control" required>
                        </div>

                        <!-- Contact Details -->
                        <div class="form-group">
                            <label for="contact_details" style="color:red">Contact Details</label>
                            <input type="text" name="contact_details" id="contact_details" class="form-control" required>
                        </div>

                        <!-- Cuisine Type -->
                        <div class="form-group">
                            <label for="cuisine_type" style="color:red">Cuisine Type</label>
                            <input type="text" name="cuisine_type" id="cuisine_type" class="form-control" required>
                        </div>

                        <!-- Email -->
                        <div class="form-group">
                            <label for="email" style="color:red">Email</label>
                            <input type="email" name="email" id="email" class="form-control" required>
                        </div>

                        <!-- Password -->
                        <div class="form-group">
                            <label for="password" style="color:red">Password</label>
                            <input type="password" name="password" id="password" class="form-control" required>
                        </div>

                        <!-- Remember Token -->
                        <input type="hidden" name="remember_token" value="{{ Str::random(60) }}">

                        <div class="form-group">
                            <button type="submit" style="color:red" class="btn btn-primary">Create Restaurant</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
