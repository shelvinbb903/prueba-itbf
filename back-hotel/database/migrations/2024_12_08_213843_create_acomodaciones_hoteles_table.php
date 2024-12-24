<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAcomodacionesHotelesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('acomodaciones_hoteles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('hotel_id');
            $table->unsignedBigInteger('regla_habitacion_id');
            $table->integer('cantidad');
            $table->timestamps();
            $table->foreign('hotel_id')->references('id')->on('hoteles');
            $table->foreign('regla_habitacion_id')->references('id')->on('reglas_habitaciones');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('acomodaciones_hoteles');
    }
}
