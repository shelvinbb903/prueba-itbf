<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TipoHabitaciones;

class TipoHabitacionesController extends Controller
{  
    /**
     * Obtener los todos datos de los tipos de habitaciones registradas
     * @return Object Listado de todas los tipos de habitaciones registradas
     */
    public function index(){
      $data = TipoHabitaciones::orderBy('descripcion', 'ASC')->get();
      return response()->json($data, 200);
    }
}
