<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ciudades;

class CiudadesController extends Controller
{   
  /**
   * Obtener los todos datos de las ciudades
   * @return Object Listado de todas las ciudades registradas
   */
  public function index(){
    $data = Ciudades::orderBy('nombre', 'ASC')->get();
    return response()->json($data, 200);
  }
}
