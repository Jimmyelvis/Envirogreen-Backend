<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    //
    protected $fillable = ['name', 'state'];



    public function listingsForCity()
    {
        return $this->hasMany('App\Models\Listing');
    }

    public function state()
    {
        return $this->belongsTo('App\Models\State', 'state');
    }

}
