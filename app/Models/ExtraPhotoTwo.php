<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ExtraPhotoTwo extends Model
{
    //
    //
    protected $uploads = '/images/interiors/';


    protected $fillable = ['file'];


    public function getFileAttribute($photo){


        return $this->uploads . $photo;

    }
}
