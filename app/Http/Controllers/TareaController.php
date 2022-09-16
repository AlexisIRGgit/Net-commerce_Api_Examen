<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\User;
use App\Models\tarea;
use App\Http\Requests\StoretareaRequest;
use App\Http\Requests\UpdatetareaRequest;
use Illuminate\Http\Request;
use App\Models\empresa;
use Validator;

class TareaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       
        $empresas = empresa::all();

        

       foreach($empresas as $emp){
        
        $tareas_activas = tarea::where('id_e',$emp->id)->where('status',0)->get();
        $emp->tareas_en_proceso = $tareas_activas;
        $tareas_completas = tarea::where('id_e',$emp->id)->where('status',1)->get();
        $emp->tareas_completadas = $tareas_completas;


       }
       $data = array(
        'status' => 'success',
        'tarea' => $empresas,
    ); 

    return response()->json($data);
      
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoretareaRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        //valido datos requeridos 
        $datosValid = Validator::make($request->all(),[
            'nombre' => 'required',
            'descripcion' => 'required',
            'id_e' => 'required',
            'fecha_ini' => 'required',
            'fecha_ven' => 'required',
        ],[],[]);
        
        //valido si ubo un error 
        if ($datosValid->fails()) {
            $data = array(
                'status' => 'error',
                'error' => 'se requieren mas datos'
            );

            return response()->json($data);
        }

        //si no hubo errores verifico si es que asignaron algun id de usuario
        if(!empty($request->id_u)){
            //si se encontro que el campo no esta vacio

            //Busco el usuario
            $Usuario = User::find($request->id_u);

            //reviso cuantas tareas tiene ese usuario
            $tareasAsign = tarea::where('id_u',$request->id_u)->where('status',0)->get()->count();
            

            //si es que existe el usuario y no tiene tareas o si sus tareas son menores a 5
            if(!empty($Usuario) && $tareasAsign < 5){

                //creo la nueva tarea con usuario asignado
                $tarea = new tarea();
                $tarea->nombre = $request->nombre;
                $tarea->descripcion = $request->descripcion;
                $tarea->id_u = $request->id_u;
                $tarea->nombre_u = $Usuario->name;
                $tarea->id_e = $request->id_e;
                $tarea->fecha_ini = $request->fecha_ini;
                $tarea->fecha_ven = $request->fecha_ven;

                $tarea->save();
                
                $data = array(
                    'status' => 'success',
                    'tarea' => $tarea,
                ); 
                return response()->json($data);
            }else{
                //si no encontro el usuario entonces
                $data = array(
                    'status' => 'error',
                    'error' => 'usuario no existe o tiene el maximo de tareas que se le puede asignar'
                );
    
                return response()->json($data);
            }
        }else{
            //si no asignaron un usuario se creara la tarea sin usuario asignado
                $tarea = new tarea();
                $tarea->nombre = $request->nombre;
                $tarea->descripcion = $request->descripcion;
                $tarea->nombre_u = "Usuario sin asignar";
                $tarea->id_e = $request->id_e;
                $tarea->fecha_ini = $request->fecha_ini;
                $tarea->fecha_ven = $request->fecha_ven;

                $tarea->save();
                
                $data = array(
                    'status' => 'success',
                    'tarea' => $tarea,
                ); 
        
                return response()->json($data);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\tarea  $tarea
     * @return \Illuminate\Http\Response
     */
    public function show(tarea $tarea)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\tarea  $tarea
     * @return \Illuminate\Http\Response
     */
    public function edit(tarea $tarea)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdatetareaRequest  $request
     * @param  \App\Models\tarea  $tarea
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {

       
        $tarea = tarea::find($request->id);

        
        if(!empty($request->id_u) && $request->id_u != null){

            //Busco el usuario
            $Usuario = User::find($request->id_u);

            //reviso cuantas tareas tiene ese usuario
            $tareasAsign = tarea::where('id_u',$request->id_u)->where('status',0)->get()->count();

                        //si es que existe el usuario y no tiene tareas o si sus tareas son menores a 5
                        if(!empty($Usuario) && $tareasAsign < 5){

                            //creo la nueva tarea con usuario asignado
                            
                            $tarea->nombre = $request->nombre;
                            $tarea->descripcion = $request->descripcion;
                            $tarea->id_u = $request->id_u;
                            $tarea->nombre_u = $Usuario->name;
                            $tarea->id_e = $request->id_e;
                            $tarea->fecha_ini = $request->fecha_ini;
                            $tarea->fecha_ven = $request->fecha_ven;
            
                            $tarea->save();
                            
                            $data = array(
                                'status' => 'success',
                                'tarea' => $tarea,
                            ); 
                            return response()->json($data);
                        }else{
                            //si no encontro el usuario entonces
                            $data = array(
                                'status' => 'error',
                                'error' => 'usuario no existe o tiene el maximo de tareas que se le puede asignar'
                            );
                
                            return response()->json($data);
                        }

        }else{
            
            $tarea->nombre = $request->nombre;
            $tarea->descripcion = $request->descripcion;
            $tarea->id_u = null;
            $tarea->nombre_u = "Usuario sin asignar";
            $tarea->id_e = $request->id_e;
            $tarea->fecha_ini = $request->fecha_ini;
            $tarea->fecha_ven = $request->fecha_ven;

            $tarea->save();
            
            $data = array(
                'status' => 'success',
                'tarea' => $tarea,
            ); 
    
            return response()->json($data);
        }

        
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\tarea  $tarea
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $tarea = tarea::destroy($request->id);

        $data = array(
            'status' => 'destroy',
            'tarea' => $tarea,
        ); 

        return response()->json($data);

    }

    
    public function taskComp(Request $request)
    {
        $tarea = tarea::find($request->id);
        $tarea->status = $request->status;
        $tarea->save();

        $data = array(
            'status' => 'success',
            'status_tarea' => 'Completada',
            'tarea' => $tarea,
        ); 
        return response()->json($data);
    }

}
