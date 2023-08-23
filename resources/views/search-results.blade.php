
@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Search Results</h1>

    @if ($results->isEmpty())
        <p>No restaurants found matching your criteria.</p>
    @else
        <ul>
            @foreach ($results as $restaurant)
                <li>{{ $restaurant->name }} - {{ $restaurant->location }} - {{ $restaurant->cuisine_type }}</li>
                <li>Ratings: {{ $restaurant->rating }} stars and above</li>
                <!-- Add more restaurant details here as needed -->
            @endforeach
        </ul>
    @endif
</div>
@endsection
