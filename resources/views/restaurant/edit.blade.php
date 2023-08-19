<form method="POST" action="{{ route('restaurant.update', $restaurant->id) }}">
    @csrf
    @method('PUT')

    <!-- Populate form fields with restaurant data -->
    <input type="text" name="name" value="{{ $restaurant->name }}" />
    <input type="text" name="location" value="{{ $restaurant->location }}" />
    <!-- Other fields... -->

    <button type="submit">Save Changes</button>
</form>
