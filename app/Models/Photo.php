<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Photo extends Model
{
  //

    protected $uploads = '/images/people/';


    protected $fillable = ['file'];


    public function getFileAttribute($photo){


        return $this->uploads . $photo;

    }
}
