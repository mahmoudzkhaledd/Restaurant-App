<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reservation extends Model
{
    use HasFactory;

    protected $id = 'id';

    protected $table = 'reservations';

    protected $fillable = [
        'name',
        'phone',
        'date_time',
        'guest_number',
        'table_id',
    ];
}
