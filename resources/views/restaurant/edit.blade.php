<form method="POST" action="{{ route('restaurant.update', $restaurant->id) }}">
    @csrf
    @method('PUT')

    <input type="text" name="name" value="{{ $restaurant->name }}" />
    <input type="text" name="location" value="{{ $restaurant->location }}" />

    <button type="submit">Save Changes</button>
</form>
