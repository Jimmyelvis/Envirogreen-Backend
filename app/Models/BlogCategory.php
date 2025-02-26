<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BlogCategory extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function blogPosts()
    {
        return $this->hasMany(BlogPost::class, 'blogcat_id', 'id');
    }
}
