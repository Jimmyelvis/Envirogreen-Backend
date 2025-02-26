<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PhotoListing extends Model
{
    //
    //
    protected $uploads = '/images/houses/';

    protected $table = 'photoslisting';


    protected $fillable = ['file'];


    public function getFileAttribute($fullpic){


        return $this->uploads . $fullpic;

    }

    public function listing(){

        return $this->belongsTo('App\Models\Listing');

    }
}
