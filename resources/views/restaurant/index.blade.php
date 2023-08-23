@foreach ($restaurants as $restaurant)
    <div>
        <h2>{{ $restaurant->name }}</h2>
        <p>Location: {{ $restaurant->location }}</p>
        <p>Cuisine: {{ $restaurant->cuisine_type }}</p>
        <!-- Add more restaurant details as needed -->
    </div>
@endforeach
