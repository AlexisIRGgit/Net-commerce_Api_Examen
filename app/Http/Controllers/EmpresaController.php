<?php

namespace App\Http\Controllers;

use App\Models\empresa;
use Auth;
use App\Models\User;
use App\Models\tarea;
use App\Http\Requests\StoreempresaRequest;
use App\Http\Requests\UpdateempresaRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;

class EmpresaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $empresas = empresa::all();

        return $empresas;
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreempresaRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        $empresa =new empresa();

        $empresa->nombre = $request->nombre;

        $empresa->save();

        $data = array(
            'status' => 'success',
            'Empresa' => $empresa,
        ); 
        return response()->json($data);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\empresa  $empresa
     * @return \Illuminate\Http\Response
     */
    public function show(empresa $empresa)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\empresa  $empresa
     * @return \Illuminate\Http\Response
     */
    public function edit(empresa $empresa)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateempresaRequest  $request
     * @param  \App\Models\empresa  $empresa
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
      
        $empresa = empresa::find($request->id);

        $empresa->nombre = $request->nombre;

        $empresa->save();

        $data = array(
            'status' => 'success',
            'Empresa' => $empresa,
        ); 
        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\empresa  $empresa
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $Request)
    {
        $empresa = empresa::destroy($request->id);

        $data = array(
            'status' => 'destroy',
            'Empresa' => $empresa,
        ); 
        return response()->json($data);

    }

    //Empresa con mas tareas pendientes
    public function EmpresasTareas(){
        
        $empresas = empresa::all();

        $max = 0;
        $id_emp = 0;

       foreach($empresas as $emp){
        
        $tareas_num = tarea::where('id_e',$emp->id)->where('status',0)->count();
        $emp->num_tareas_pendientes = $tareas_num;

        if($tareas_num > $max){
            $id_emp = $emp->id;
        }

        $tareas_pendientes = tarea::where('id_e',$emp->id)->where('status',0)->get();
        $emp->tareas_pendientes = $tareas_pendientes;

       }

       $empresa = $empresas->where('id',$id_emp);

       $usuarios = User::all();

       foreach($usuarios as $usu){
        
        $tareas_num = tarea::where('id_u',$usu->id)->where('status',0)->count();
        $usu->tareas_num = $tareas_num;

        $tareas_pendientes = tarea::where('id_u',$usu->id)->where('status',0)->get();
        $usu->tareas_pendientes = $tareas_pendientes;

       }
       
       $usuarios_menos_tareas = $usuarios->where('tareas_num', '<', 3);
       


       $colect_empresas = collect([
        'Empresa con mas tareas' => $empresa,
        'Usuarios con menos tareas' => $usuarios_menos_tareas->sortBy('tareas_num')
        ]);

        return response()->json($colect_empresas);


    }
}
