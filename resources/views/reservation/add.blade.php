@extends('layouts.app')

@section('content')

<div style="margin:2rem">
    <strong style="font-size: 1.5rem">
        Make a Reservation
    </strong>

    <br>
    <br>

    <form method="POST" action="{{ route('choose.table', request()->route('restaurant_id')) }}">
        @csrf


        {{-- Name --}}
        <div>
            <label for="name">Your Name</label>
            <span>&nbsp;</span>
            <input type="text" name="name" id="name" required>
        </div>

        <br>

        {{-- Phone Number --}}
        <div>
            <label for="phone">Phone Number</label>
            <span>&nbsp;</span>
            <input type="text" name="phone" id="phone" required>
        </div>

        <br>

        {{-- Date & Time --}}
        <div>
            <label for="date_time">Pick a Date and Time</label>
            <span>&nbsp;</span>
            <input type="datetime-local" name="date_time" id="date_time" required>
        </div>

        <br>

        {{-- Number of Guests --}}
        <div>
            <label for="guest_number">Number of Guests</label>
            <span>&nbsp;</span>
            <input type="number" name="guest_number" id="guest_number" min="1" max="100"  required>
        </div>

        <br>

        <br>


        {{-- Next --}}
        <strong>
            <button type="submit" style="color: white; background-color:green; padding:0.7rem">
                Next
            </button>
        </strong>
    </form>
</div>

@endsection
