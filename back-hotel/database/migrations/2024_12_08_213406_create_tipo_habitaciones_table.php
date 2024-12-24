<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTipoHabitacionesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipo_habitaciones', function (Blueprint $table) {
            $table->id();
            $table->string('descripcion', 255);
        });
        $data = [
            ['descripcion'=>'Estándar'],
            ['descripcion'=>'Junior'],
            ['descripcion'=>'Suite'],
        ];
        DB::table('tipo_habitaciones')->insert($data);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tipo_habitaciones');
    }
}
