<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Table extends Model
{
    use HasFactory;

    protected $id = 'id';

    protected $table = 'tables';

    protected $fillable = [
        'capacity'
    ];
}
