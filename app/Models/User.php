<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'skype',
        'phone',
        'role_id',
        'position_id',
        'photo_id',
        'facebook',
        'twitter',
        ''
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function role(){
        return $this->belongsTo('App\Models\Role', 'role_id');
    }

    public function position(){
        return $this->belongsTo('App\Models\Position', 'position_id');
    }

    public function photoStaff(){
        return $this->belongsTo('App\Models\PhotoStaff', 'photoStaff_id');
    }

    // get any Listing associated with this user from the Listing model
    public function listings(){
        return $this->hasMany('App\Models\Listing');
    }


    public function isAdmin() {
        return in_array($this->role->name, ['Admin', 'SuperAdmin', 'Founder']);
    }

    public function blogPosts(){
        return $this->hasMany(BlogPost::class, 'user_id', 'id');
    }

    public function wishlist(){
        return $this->hasMany(Wishlist::class, 'user_id', 'id');
    }



}
