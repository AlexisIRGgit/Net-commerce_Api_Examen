<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tarea extends Model
{
    use HasFactory;
    protected $fillable = ['nombre','descripcion','id_u','nombre_u','id_e','fecha_ini','fecha_ven','status'];
}
