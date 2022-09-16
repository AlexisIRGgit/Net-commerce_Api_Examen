<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\empresa;
use App\Models\User;
use App\Models\tarea;




class TareaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for($i = 1; $i <= 15 ; $i++){

            $tarea =new tarea();

            $tarea->nombre = "Tarea".$i;
            $tarea->descripcion	 = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ".$i;
            $tarea->id_u  = random_int(1,5);
            $Usuario = User::find($tarea->id_u);
            $tarea->nombre_u  = $Usuario->name;
            $tarea->id_e  = random_int(1,5);
            $tarea->fecha_ini = "2022-09-14";
            $tarea->fecha_ven = "2022-09-18";
            $tarea->status = random_int(0,1);

            $tarea->save();

        }

        for($i = 16; $i <= 30 ; $i++){

        $tarea = new tarea();
        $tarea->nombre = "Tarea".$i;
        $tarea->descripcion = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ".$i;
        $tarea->nombre_u = "Usuario sin asignar";
        $tarea->id_e = random_int(1,5);
        $tarea->fecha_ini = "2022-09-14";
        $tarea->fecha_ven = "2022-09-18";
        $tarea->status = random_int(0,1);

        $tarea->save();
        }
    }
}
