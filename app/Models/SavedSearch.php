<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SavedSearch extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $table = 'savedsearches';

    public function user(){
        return $this->belongsTo(User::class,'user_id','id');
    }

    public function City(){
        return $this->belongsTo(City::class,'city_id','id');
    }

    public function State(){
        return $this->belongsTo(State::class,'state_id','id');
    }

    public function Category(){
        return $this->belongsTo(Category::class,'category_id','id');
    }
}
