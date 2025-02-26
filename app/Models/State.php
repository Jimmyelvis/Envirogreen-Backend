<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    //
    protected $fillable = ['name' , 'abbrev'];

    public function cities()
    {
        return $this->hasMany('App\Models\City');
    }

    public function listings()
    {
        return $this->hasManyThrough('App\Models\Listing', 'App\Models\City');
    }

    public function listingsForState()
    {
        return $this->hasManyThrough('App\Models\Listing', 'App\Models\City');
    }


}
