<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CiudadesController;
use App\Http\Controllers\TipoHabitacionesController;
use App\Http\Controllers\AcomodacionesController;
use App\Http\Controllers\HotelesController;
use App\Http\Controllers\ReglasHabitacionesController;
use App\Http\Controllers\AcomodacionesHotelesController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});*/
Route::get('/ciudades', [CiudadesController::class, 'index']);
Route::get('/tipo_habitaciones', [TipoHabitacionesController::class, 'index']);
Route::get('/acomodaciones', [AcomodacionesController::class, 'index']);

Route::get('/hoteles', [HotelesController::class, 'index']);
Route::post('/hoteles', [HotelesController::class, 'post']);

Route::post('/reglas_habitaciones', [ReglasHabitacionesController::class, 'post']);
Route::get('/reglas_habitaciones', [ReglasHabitacionesController::class, 'index']);

Route::post('/acomodaciones_hoteles', [AcomodacionesHotelesController::class, 'post']);
Route::get('/acomodaciones_hoteles', [AcomodacionesHotelesController::class, 'index']);
