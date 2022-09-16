<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\empresa;
use App\Models\User;
use App\Models\tarea;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        for($i = 1; $i <= 30 ; $i++){

            $user = new User();

            $user->name = "Usuario".$i;
            $user->email = "Usuario".$i."@gmail.com";
            $user->password = bcrypt("password");

            $user ->save();

        }

    }
}
