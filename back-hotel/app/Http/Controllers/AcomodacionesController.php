<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Acomodaciones;

class AcomodacionesController extends Controller
{
  /**
   * Obtener los todos datos de las acomodaciones
   * @return Object Listado de todas las acomodaciones registradas
   */
  public function index(){
    $data = Acomodaciones::orderBy('descripcion', 'ASC')->get();
    return response()->json($data, 200);
  }
}
