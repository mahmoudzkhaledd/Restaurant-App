<form method="POST" action="{{ route('restaurant.menu.update', ['restaurant_id' => $restaurant->id, 'meal_id' => $meal->id]) }}">
    @csrf
    @method('PUT')

    <!-- Meal Name -->
    <div class="form-group">
        <label for="name">Meal Name</label>
        <input type="text" name="name" id="name" class="form-control" value="{{ $meal->name }}" required>
    </div>

    <!-- Description -->
    <div class="form-group">
        <label for="description">Description</label>
        <textarea name="description" id="description" class="form-control" required>{{ $meal->description }}</textarea>
    </div>

    <!-- Price -->
    <div class="form-group">
        <label for="S_price">Price (S)</label>
        <input type="text" name="S_price" id="S_price" class="form-control" value="{{ $meal->S_price }}" required>
    </div>

    <div class="form-group">
        <label for="M_price">Price (M)</label>
        <input type="text" name="M_price" id="M_price" class="form-control" value="{{ $meal->M_price }}" required>
    </div>

    <div class="form-group">
        <label for="L_price">Price (L)</label>
        <input type="text" name="L_price" id="L_price" class="form-control" value="{{ $meal->L_price }}" required>
    </div>

    <!-- Rating -->
    <div class="form-group">
        <label for="rating">Rating</label>
        <input type="text" name="rating" id="rating" class="form-control" value="{{ $meal->rating }}" required>
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-primary">Update Meal</button>
    </div>
</form>
