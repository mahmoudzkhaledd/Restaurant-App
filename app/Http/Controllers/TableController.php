<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Table;

class TableController extends Controller
{
    public function create()
    {
        return view('table.add');
    }

    public function store(Request $request, $restaurant_id)
    {
        $table = new Table();
        $table->restaurant_id = $restaurant_id;
        $table->capacity = $request->input('capacity');
        $table->save();

        return("Table Added Successfully!");
    }
}
