<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hoteles extends Model
{
    use HasFactory;

    protected $table = 'hoteles';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
        'direccion',
        'nit',
        'ciudad_id',
        'n_habitaciones',
    ];

    public function ciudad()
    {
        return $this->HasOne('App\Models\Ciudades', 'id', 'ciudad_id');
    }
}
