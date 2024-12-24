<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class ReglasHabitaciones extends Model
{
    use HasFactory;

    protected $table = 'reglas_habitaciones';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'tipo_habitacion_id',
        'acomodacion_id',
    ];

    public function tipo_habitaciones()
    {
        return $this->HasOne('App\Models\TipoHabitaciones', 'id', 'tipo_habitacion_id');
    }

    /**
     * Get the comments for the blog post.
     */
    public function acomodaciones()
    {
        return $this->HasOne('App\Models\Acomodaciones', 'id', 'acomodacion_id');
    }
}
