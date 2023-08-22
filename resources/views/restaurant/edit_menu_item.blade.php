<form method="POST" action="{{ route('restaurant.menu.update', ['restaurant_id' => $restaurant->id, 'meal_id' => $menuItem->id]) }}">
    @csrf
    @method('PUT')

    <!-- Add form fields for updating menu item details -->
</form>
