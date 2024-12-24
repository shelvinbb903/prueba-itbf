<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReglasHabitacionesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reglas_habitaciones', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tipo_habitacion_id');
            $table->unsignedBigInteger('acomodacion_id');
            $table->timestamps();
            $table->foreign('tipo_habitacion_id')->references('id')->on('tipo_habitaciones');
            $table->foreign('acomodacion_id')->references('id')->on('acomodaciones');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('reglas_habitaciones');
    }
}
