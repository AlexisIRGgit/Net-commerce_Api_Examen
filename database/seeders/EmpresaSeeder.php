<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\empresa;
use App\Models\User;
use App\Models\tarea;


class EmpresaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for($i = 1; $i <= 30 ; $i++){

            $empresas =new empresa();

            $empresas->nombre = "Empresa".$i;

            $empresas->save();

        }
    }
}
