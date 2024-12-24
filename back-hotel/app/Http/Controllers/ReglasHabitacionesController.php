<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ReglasHabitaciones;
use Illuminate\Support\Facades\Validator;

class ReglasHabitacionesController extends Controller
{
  /**
   * Obtener los todos datos de las reglas de las acomodaciones con respecto al tipo de habitacion seleccionado
   * @return Object Listado de todas las acomodaciones con respecto al tipo de habitacion seleccionado
   */
  public function index(Request $request){
    $data = ReglasHabitaciones::query()
    ->select('id', 'acomodacion_id')
    ->with('acomodaciones')
    ->where('tipo_habitacion_id', $request->tipo_habitacion)
    ->get();
    return response()->json($data, 200);
  }

  /**
 * Registrar en la base de datos la informacion del usuario
 * @param  Request $request Payload con los datos enviados por el usuario
 * @return Object Datos de la regla registrada
 */
  public function post(Request $request) {
    // Validar que los campos enviados sean correctos
    $validator = Validator::make($request->all(), [
      'tipo_habitacion_id' => 'required',
      'acomodacion_id' => 'required',
    ]);

    // Si hay algun error en un valor enviado se genera una respuesta con error
    if ($validator->fails()) {
      return response()->json($validator->messages(), 401);
    }

    $regla = new ReglasHabitaciones;
    // Asignar los valores a las propiedades
    $regla->tipo_habitacion_id = $request->tipo_habitacion_id;
    $regla->acomodacion_id = $request->acomodacion_id;
    // Generar en la base de datos el nuevo registro
    $regla->save();

    return response()->json($regla, 200);
  }
}
