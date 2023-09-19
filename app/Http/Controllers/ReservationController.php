<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Symfony\Component\Console\Input\Input;

class ReservationController extends Controller
{
    public function create()
    {
        return view('reservation.add');
    }

    public function store(Request $request, $restaurant_id)
    {

        $reservation = new Reservation();
        $reservation->user_id = auth()->user()->getAuthIdentifier();
        $reservation->restaurant_id = $restaurant_id;
        $reservation->table_id = $request->input('tables');
        $reservation->name = $request->input('name');
        $reservation->phone = $request->input('phone');
        $reservation->date_time = date('Y-m-d H:i:s', strtotime($request->input('date_time')));
        $reservation->guest_number = (int)$request->input('guest_number');
        $reservation->save();

        return "Reservation Made Successfully!";
    }

    public function getRestaurantTable(Request $old_request ,$restaurant_id)
    {
        $date_time = date('Y-m-d', strtotime($old_request->input('date_time')));


        $reserved_tables = DB::table('reservations')->where('restaurant_id', $restaurant_id)->orderBy('date_time')->get()
        ->filter(function ($value) use($date_time) {
            return date('Y-m-d', strtotime($value->date_time)) == $date_time;
        })->pluck('table_id');


        return DB::table('tables')->where('restaurant_id', '=', $restaurant_id)
        ->whereNotIn('id', $reserved_tables)
        ->where('avalability', '=', 1)
        ->where('capacity', ">=", (int)$old_request->input('guest_number'))->pluck('id');
    }

    public function to_tables(Request $old_request)
    {
        return view('reservation.chooseTable')->with('old_request', $old_request);
    }
}
