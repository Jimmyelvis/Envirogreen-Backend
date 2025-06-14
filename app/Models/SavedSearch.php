<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SavedSearch extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $table = 'savedsearches';
    protected $dates = ['created_at', 'updated_at'];

    public function getCreatedAtFormattedAttribute()
    {
        return $this->created_at ? $this->created_at->format('M d, Y') : null;
    }

    public function getUpdatedAtFormattedAttribute()
    {
        return $this->updated_at ? $this->updated_at->format('M d, Y') : null;
    }

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
