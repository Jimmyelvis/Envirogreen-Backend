<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Scopes\ForRentScope;

class Listing extends Model
{

    //
      protected $fillable = [

        'street',
        'city_id',
        'state_id',
        'price',
        'beds',
        'baths',
        'sqft',
        'descrip',
        'category_id',
        'user_id',
        'state_id',
        'fullpic_id',
        'extrapicone_id',
        'extrapictwo_id',
        'extrapicthree_id',
        'extrapicfour_id',
        'feat_id',
        'main_photo',
        'city_name',
        'extraphotos',


      ];

      // protected $primaryKey = 'id';

      public function user(){

          return $this->belongsTo('App\Models\User');

      }

      public function state(){

          return $this->belongsTo('App\Models\State');

      }

      public function city(){

          return $this->belongsTo('App\Models\City');

      }

      public function category(){

        return $this->belongsTo('App\Models\Category');

      }

      public function fullpic(){

        return $this->belongsTo('App\Models\PhotoListing');

      }

      public function extrapicone(){

        return $this->belongsTo('App\Models\ExtraPhotoOne');

      }

      public function extrapictwo(){

        return $this->belongsTo('App\Models\ExtraPhotoTwo');

      }

      public function extrapicthree(){

        return $this->belongsTo('App\Models\ExtraPhotoThree');

      }

      public function extrapicfour(){

        return $this->belongsTo('App\Models\ExtraPhotoFour');

      }

      protected $casts = [
        'extraphotos' => 'array',
      ];

      //scopes

      public function queryhelper() {
        echo('from query helper');
      }


      public function scopeCitySearch($query, $s)
      {
          return $query->where('city', 'like', '%' .$s. '%');
      }

      public function scopeLessThanthreehundred($query)
      {
        return $query->where('price', '<', 300000);
      }

      public function scopeGreatThanthreehundred($query)
      {
        return $query->where('price', '>', 300000);
      }

      public function scopeOrderedBy($query)
      {
        return $query->orderBy('price', 'asc');
      }


}
