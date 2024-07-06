<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ExtraPhotoOne extends Model
{
    //
    protected $uploads = '/images/interiors/';


    protected $fillable = ['file'];

    // protected $primaryKey = 'extrapicone_id';

    public function getFileAttribute($photo){


        return $this->uploads . $photo;

    }
}
