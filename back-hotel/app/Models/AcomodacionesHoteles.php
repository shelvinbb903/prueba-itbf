<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AcomodacionesHoteles extends Model
{
    use HasFactory;

    protected $table = 'acomodaciones_hoteles';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'hotel_id',
        'regla_habitacion_id',
        'cantidad',
    ];

    /**
     * Get the comments for the blog post.
     */
    public function reglas_acomodaciones()
    {
        return $this->HasOne('App\Models\ReglasHabitaciones', 'id', 'regla_habitacion_id');
    }
}
