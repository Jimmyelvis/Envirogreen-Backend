<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PhotoStaff extends Model
{
    //
    protected $uploads = '/images/people/';

    protected $table = 'photosstaff';


    protected $fillable = ['file'];


    public function getFileAttribute($photo){


        return $this->uploads . $photo;

    }
}
