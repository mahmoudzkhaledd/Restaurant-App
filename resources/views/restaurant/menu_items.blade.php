<h1>Menu Items for {{ $restaurant->name }}</h1>
@if ($menuItems)
    <ul>
        @foreach ($menuItems as $menuItem)
            <li>
                <h2>{{ $menuItem->name }}</h2>
                <p>{{ $menuItem->description }}</p>
                <p>Price (S): ${{ $menuItem->S_price }}</p>
                <p>Price (M): ${{ $menuItem->M_price }}</p>
                <p>Price (L): ${{ $menuItem->L_price }}</p>
            </li>
            {{-- {{ $menuItem->image }} --}}

            @if ($menuItem->image)
             <img src="{{ asset('storage/' . $menuItem->image) }}" alt="{{ $menuItem->name }}">

            @endif

            <a href="{{ route('meals.edit', ['restaurant_id' => $restaurant->id, 'meal_id' => $menuItem->id]) }}">Edit Meal</a>

        
        @endforeach
    </ul>
@else
    <p>No menu items available for this restaurant.</p>
@endif
