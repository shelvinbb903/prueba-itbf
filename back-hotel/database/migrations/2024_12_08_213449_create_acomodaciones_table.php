<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAcomodacionesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('acomodaciones', function (Blueprint $table) {
            $table->id();
            $table->string('descripcion', 255);
        });
        $data = [
            ['descripcion'=>'Sencilla'],
            ['descripcion'=>'Doble'],
            ['descripcion'=>'Triple'],
            ['descripcion'=>'Cuádruple'],
        ];
        DB::table('acomodaciones')->insert($data);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('acomodaciones');
    }
}
