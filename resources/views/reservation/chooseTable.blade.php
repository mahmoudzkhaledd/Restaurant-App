@php
$controller = new App\Http\Controllers\ReservationController();
$tables = $controller->getRestaurantTable($old_request, request()->route('restaurant_id'));
@endphp

@extends('layouts.app')

@section('content')
<div style="margin:2rem">

    <form method="POST" action="{{ route('reservation.add', ["restaurant_id" =>request()->route('restaurant_id'), "old_request" => $old_request]) }}">
        @csrf

        <input type="hidden" name="name" id="name" value="{{ $old_request->input('name') }}">
        <input type="hidden" name="phone" id="phone" value="{{ $old_request->input('phone') }}">
        <input type="hidden" name="date_time" id="date_time" value="{{ $old_request->input('date_time') }}">
        <input type="hidden" name="guest_number" id="guest_number" value="{{ $old_request->input('guest_number') }}">

        {{-- Available Tables --}}
        <div>
            <label for="tables">Available Tables</label>
            <span>&nbsp;</span>
            <select name="tables" id="tables" class="combo" required>
                @foreach ($tables as $table)
                <option value={{$table}}>Table {{$table}} </option>
                @endforeach

            </select>
        </div>

        <br>

        {{-- Submit --}}
        <strong>
            <button type="submit" style="color: white; background-color:green; padding:0.7rem">
                Make a Reservation
            </button>
        </strong>

    </form>

</div>
@endsection
