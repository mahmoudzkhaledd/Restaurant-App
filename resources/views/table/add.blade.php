@extends('layouts.app')

@section('content')

<div>
    <strong>
        Add Table
    </strong>

    <br>
    <br>

    <form method="POST" action="{{ route('table.store', request()->route('restaurant_id')) }}">
        @csrf

        {{-- Add Table Capacity --}}
        <div>
            <label for="capacity">Table Capacity</label>
            <span>&nbsp;</span>
            <input type="number" name="capacity" id="capacity" min="1" max="100" required>
        </div>

        <br>


        {{-- Submit --}}
        <strong>
            <button type="submit" style="color: white; background-color:green; padding:0.3rem">
                Add Table
            </button>
        </strong>
    </form>
</div>

@endsection
