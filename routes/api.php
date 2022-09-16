<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

// Route::get('/empresas','App\Http\Controllers\EmpresaController@index');

// Route::get('/empresa',function(){
//     return 'hola';
//         // Route::post('emp',['App\Http\Controllers\EmpresaController','store']);

// });


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// rutas de empresa 
Route::get('/empresas','App\Http\Controllers\EmpresaController@index');
Route::get('/empresasTask','App\Http\Controllers\EmpresaController@EmpresasTareas');
Route::post('/empresas','App\Http\Controllers\EmpresaController@store');
Route::put('/empre/{id}','App\Http\Controllers\EmpresaController@update');
Route::delete('/empre/{id}','App\Http\Controllers\EmpresaController@destroy');

//rutas de tareas
Route::get('/tareas','App\Http\Controllers\TareaController@index');
Route::post('/tareas','App\Http\Controllers\TareaController@store');
Route::put('/tarea/{id}','App\Http\Controllers\TareaController@update');
Route::delete('/tarea/{id}','App\Http\Controllers\TareaController@destroy');
Route::post('/tareaComp/{id}','App\Http\Controllers\TareaController@taskComp');