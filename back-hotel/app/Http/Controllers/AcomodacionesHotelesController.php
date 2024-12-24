<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AcomodacionesHoteles;
use App\Models\Hoteles;
use Illuminate\Support\Facades\Validator;

class AcomodacionesHotelesController extends Controller
{
  /**
   * Obtener los todos datos las acomodaciones de las habitaciones de un hotel
   * 
   * @return Object Listado de todas las acomodaciones de las habitaciones de un hotel
   */
  public function index(Request $request){
    $data = AcomodacionesHoteles::query()
    ->with('reglas_acomodaciones')
    ->where('hotel_id', $request->hotel_id)
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
      'hotel_id' => 'required',
      'acomodaciones' => 'present|array',
      'acomodaciones.*.regla_habitacion_id' => 'required',
      'acomodaciones.*.cantidad' => 'required',
    ]);

    // Si hay algun error en un valor enviado se genera una respuesta con error
    if ($validator->fails()) {
      return response()->json($validator->messages(), 401);
    }

    $hotel = Hoteles::where([
      ['id', '=', $request->hotel_id]
    ])->first();

    if(!$hotel) {
      return response()->json(array("message" => "Hotel does not exist"), 404);
    }

    foreach ($request->acomodaciones as $key => $value) {
      
      if($value["id"] == ""){
        $regla = new AcomodacionesHoteles;
        // Asignar los valores a las propiedades
        $regla->hotel_id = $request->hotel_id;
        $regla->regla_habitacion_id = $value["regla_habitacion_id"];
        $regla->cantidad = $value["cantidad"];
        // Generar en la base de datos el nuevo registro
        $regla->save();
      } else {
        if($value["borrar"]){
          AcomodacionesHoteles::where('id', '=', $value["id"])->delete();
        } else {
          // Ejecutar la accion de actualizar
          AcomodacionesHoteles::where('id', '=', $value["id"])->update(
            [
              "cantidad" => $value["cantidad"],
              "regla_habitacion_id" => $value["regla_habitacion_id"],
            ]
          );
        }
        
      }
      
    }

    return response()->json([], 200);
  }
}
