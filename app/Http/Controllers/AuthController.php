<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request) {
        $fields = $request->validate([
            'name' => 'required|string',
            'email' => 'required|string|unique:users,email',
            'password' => 'required|string|confirmed',
            // 'photoStaff_id' => 'nullable|integer',
        ]);

        $user = User::create([
            'name' => $fields['name'],
            'email' => $fields['email'],
            'password' => bcrypt($fields['password']),
            'role_id' => 3,
            'photo_staff_id' => 21,
        ]);

        $token = $user->createToken('myapptoken')->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token
        ];

        return response($response, 201);
    }

    public function login(Request $request) {
        $fields = $request->validate([
            'email' => 'required|string',
            'password' => 'required|string'
        ]);

        // Check email
        $user = User::where('email', $fields['email'])->first();

        // Check password
        if(!$user || !Hash::check($fields['password'], $user->password)) {
            return response([
                'message' => 'Bad creds'
            ], 401);
        }

        // get photo from Modal associated with photoStaff_id and appeand to user object
        // $user->photo = $user->photoStaff->photo;

        // get the file field from the Photo Modal associated with photoStaff_id assign it to a variable called photo_path and appeand to user object
        $user->photo_path = $user->photoStaff->file;

        // get role name from Modal associated with role_id and appeand to user object
        $user->role = $user->role->name;

        // get position name from Modal associated with position_id and appeand to user object
        $user->position = $user->position->name;

        // get wishlist from Modal associated with user_id and appeand to user object, and get info associated with property_id
        // $user->wishlist = $user->wishlist()->with('listing')->get();


        // get listings from Modal associated with user_id and appeand to user object
        // $user->listings = $user->listings;

        // get blog posts from Modal associated with user_id and appeand to user object
        // $user->blogPosts = $user->blogPosts;





        $token = $user->createToken('myapptoken')->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token,
            'message' => 'Successfully Logged in as ' . $user->name
        ];

        return response($response, 201);
    }

    public function logout(Request $request) {
        auth()->user()->tokens()->delete();

        return [
            'message' => 'Successfully Logged out'
        ];
    }
}
