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
        @endforeach
    </ul>
@else
    <p>No menu items available for this restaurant.</p>
@endif
