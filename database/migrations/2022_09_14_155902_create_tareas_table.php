<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTareasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tareas', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');
            $table->string('descripcion');
            $table->unsignedBigInteger('id_u')->nullable();
            $table->string('nombre_u')->nullable();
            $table->unsignedBigInteger('id_e');
            $table->date('fecha_ini');
            $table->date('fecha_ven');
            $table->boolean('status')->default(0);
            $table->timestamps();

            $table->foreign('id_u')->references('id')->on('users');
            $table->foreign('id_e')->references('id')->on('empresas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tareas');
    }
}
