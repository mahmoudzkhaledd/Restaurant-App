@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Add Meal to Restaurant</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('meals.store') }}" enctype="multipart/form-data">
                        @csrf

                        <input type="hidden" name="restaurant_id" value="{{ $restaurantId }}">

                        <div class="form-group">
                            <label for="name">Meal Name</label>
                            <input type="text" name="name" id="name" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea name="description" id="description" class="form-control" required></textarea>
                        </div>

                        <div class="form-group">
                            <label for="price">Price</label>
                            <input type="text" name="price" id="price" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="image">Image</label>
                            <input type="file" name="image" id="image" class="form-control-file" accept="image/*" required>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Add Meal</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
