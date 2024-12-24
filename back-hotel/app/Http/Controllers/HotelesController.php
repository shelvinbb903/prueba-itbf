<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hoteles;
use Illuminate\Support\Facades\Validator;

class HotelesController extends Controller
{ 
  /**
   * Obtener los todos datos de los hoteles
   * @return Object Listado de todos los hoteles registradas
   */
  public function index(){
    //$data = Hoteles::orderBy('nombre', 'ASC')->get();
    $data = Hoteles::query()
    ->with('ciudad')
    ->get();
    return response()->json($data, 200);
  }
  /**
 * Registrar en la base de datos la informacion del usuario
 * 
 * @param  Request $request Payload con los datos enviados por el usuario
 * @return Object Datos del usuario creado
 */

  public function post(Request $request) {
    // Validar que los campos enviados sean correctos
    $validator = Validator::make($request->all(), [
      'nombre' => 'required|max:255',
      'direccion' => 'required|max:255',
      'nit' => 'required|max:64',
      'ciudad_id' => 'required',
      'n_habitaciones' => 'required',
    ]);

    // Si hay algun error en un valor enviado se genera una respuesta con error
    if ($validator->fails()) {
      return response()->json($validator->messages(), 401);
    }

    $hotel = new Hoteles;
    // Asignar los valores a las propiedades
    $hotel->nombre = $request->nombre;
    $hotel->direccion = $request->direccion;
    $hotel->nit = $request->nit;
    $hotel->ciudad_id = $request->ciudad_id;
    $hotel->n_habitaciones = $request->n_habitaciones;
    // Generar en la base de datos el nuevo registro
    $hotel->save();

    return response()->json($hotel, 200);
  }
}
