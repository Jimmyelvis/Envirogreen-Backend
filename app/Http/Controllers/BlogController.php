<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BlogPost;
use App\Models\User;

class BlogController extends Controller
{
    //

    public function index()
    {
        // $posts = BlogPost::all();

        $posts = BlogPost::with('user')
            ->get()
            ->map(function ($post) {
                $post->user_name = $post->user->name ? : null;
                $post->user_photo_path = $post->user->photoStaff ? $post->user->photoStaff->file : null;
                return $post;
            });
        return response()->json([
            'message' => 'success',
            'count' => $posts->count(),
            'posts' => $posts
        ]);
    }

    public function show($id)
    {
        $post = BlogPost::with('user')
            ->find($id);
        $post->user_name = $post->user->name ? : null;
        $post->user_photo_path = $post->user->photoStaff ? $post->user->photoStaff->file : null;
        return response()->json([
            'message' => 'success',
            'post' => $post
        ]);
    }
}
