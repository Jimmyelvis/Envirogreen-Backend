<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BlogPost;
use App\Models\BlogCategory;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\BlogPostResource;
use App\Http\Resources\BlogCollection;


class BlogController extends Controller
{


    /*
        REturn the BlogCollection so that we can use our Blogresource to transform the data and customize the pagination meta data to our liking and then combine the transformed data with the pagination meta data.
    */
    public function index(Request $request)
{
    $sortValue = $request->input('sort', 'latest-(desc)');
    $perPage = $request->input('per_page', 20);
    $sortBy = $request->input('sort_by', 'created_at');
    $author = $request->input('author');
    $limit = $request->input('limit');

    // Map the sort value to actual sort direction
    $sort = 'desc';
    if ($sortValue === 'earliest-(asc)') {
        $sort = 'asc';
    }

    // Ensure $sort is valid
    if (!in_array($sort, ['asc', 'desc'])) {
        $sort = 'desc';
    }

    $query = BlogPost::with('user');

    if ($author !== null) {
        $query->where('user_id', $author);
    }

    if ($limit !== null) {
        // When limit is provided, get a Collection
        $posts = $query
            ->orderBy($sortBy, $sort)
            ->limit($limit)
            ->get();

        // Transform the collection directly
        $posts->transform(function ($post) {
            $post->user_name = $post->user->name ?: null;
            $post->user_photo_path = $post->user->photoStaff ? $post->user->photoStaff->file : null;
            return $post;
        });

        return response()->json([
            'message' => 'success',
            'count' => $posts->count(),
            'posts' => $posts
        ]);

    } else {
        // When limit is not provided, use pagination
        $posts = $query
            ->orderBy($sortBy, $sort)
            ->paginate($perPage);

        // Transform the items within the paginator
        $posts->getCollection()->transform(function ($post) {
            $post->user_name = $post->user->name ?: null;
            $post->user_photo_path = $post->user->photoStaff ? $post->user->photoStaff->file : null;
            return $post;
        });

        // return response()->json([
        //     'message' => 'success',
        //     'count' => $posts->total(),
        //     'current_page' => $posts->currentPage(),
        //     'last_page' => $posts->lastPage(),
        //     'per_page' => $posts->perPage(),
        //     'posts' => $posts->items(),
        // ]);

        return new BlogCollection($posts);
    }
}


    // get a count of all posts
    public function count()
    {
        $count = BlogPost::count();

        return response()->json([
            'message' => 'success',
            'count' => $count
        ]);
    }


    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'blogcat_id' => 'required|exists:blog_categories,id',
            'post_title' => 'required|string|max:255',
            'short_descp' => 'required|string',
            'long_descp' => 'required|string',
            'post_tags' => 'required|string',
            'post_image' => 'required|string',
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()->all() // Return all validation errors
            ], 422); // 422 Unprocessable Entity
        }

        try {

            // Get the authenticated user's ID
            $user_id = Auth::id();

            // Create the blog post
            $blogPost = BlogPost::create([
                'blogcat_id' => $request->input('blogcat_id'),
                'user_id' => $user_id,
                'post_title' => $request->input('post_title'),
                'post_slug' => Str::slug($request->input('post_title'), '-'),
                'post_image' => $request->input('post_image'),
                'short_descp' => $request->input('short_descp'),
                'long_descp' => $request->input('long_descp'),
                'post_tags' => $request->input('post_tags'),
            ]);

            return response()->json([
                'message' => 'Post created successfully',
                'post' => $blogPost
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        } // End Method

    }


    public function update(Request $request, $id)
    {
        // Validate the request data
        $validator = Validator::make($request->all(), [
            'blogcat_id' => 'required|exists:blog_categories,id',
            'post_title' => 'required|string|max:255',
            'short_descp' => 'required|string',
            'long_descp' => 'required|string',
            'post_tags' => 'required|string',
            'post_image' => 'required|string',
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()->all()
            ], 422);
        }

        try {
            // Find the blog post by ID
            $blogPost = BlogPost::find($id);

            if (!$blogPost) {
                return response()->json(['message' => 'Post not found'], 404);
            }

            // Get the authenticated user's ID
            $user_id = Auth::id();

            // Check if the authenticated user is the owner of the post or an admin
            // if ($blogPost->user_id !== $user_id) {
            //     return response()->json(['error' => 'Unauthorized You Need To be the Original Author'], 403);
            // }

            // Update the blog post
            $blogPost->blogcat_id = $request->input('blogcat_id');
            $blogPost->post_title = $request->input('post_title');
            $blogPost->post_slug = Str::slug($request->input('post_title'), '-');
            $blogPost->post_image = $request->input('post_image');
            $blogPost->short_descp = $request->input('short_descp');
            $blogPost->long_descp = $request->input('long_descp');
            $blogPost->post_tags = $request->input('post_tags');

            // Save the updated blog post
            $blogPost->save();

            return response()->json([
                'message' => 'Post updated successfully',
                'post' => $blogPost
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }


    public function show($id)
    {
        $post = BlogPost::find($id);
        $post->user_name = $post->user->name ?: null;
        $post->user_photo_path = $post->user->photoStaff ? $post->user->photoStaff->file : null;
        return response()->json([
            'message' => 'success',
            'post' => $post
        ]);
    }


    public function destroy($id)
    {
        try {
            // Find the blog post by ID
            $blogPost = BlogPost::find($id);

            if (!$blogPost) {
                return response()->json(['message' => 'Post not found'], 404);
            }

            // Get the authenticated user's ID
            $user_id = Auth::id();

            // Ensure the user is authenticated
            if (!$user_id) {
                return response()->json(['error' => 'You need to be logged in'], 401);
            }

            // Check if the authenticated user is the owner of the post
            // if ($blogPost->user_id !== $user_id) {
            //     return response()->json(['error' => 'Unauthorized'], 403);
            // }

            // Alternative route that also allows admins to delete posts
            if ($blogPost->user_id !== $user_id && !Auth::user()->isAdmin()) {
                return response()->json(['error' => 'Unauthorized'], 403);
            }


            // Delete the blog post
            $blogPost->delete();

            return response()->json(['message' => 'Post deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    /**
     * Set the featured number of a blog post.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function setFeatured(Request $request)
    {
        // Validate the request data
        $validator = Validator::make($request->all(), [
            'featured' => 'required|integer|min:1',
            'post_id' => 'required|exists:blog_posts,id',
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()->all(),
            ], 422);
        }

        try {
            // Get the authenticated user
            $user = Auth::user();

            // Ensure the user is authenticated
            if (!$user) {
                return response()->json(['error' => 'You need to be logged in'], 401);
            }

            // Check if the user has the required role
            if (!$user->isAdmin()) {
                return response()->json(['error' => 'Unauthorized'], 403);
            }

            // Retrieve input data
            $featuredNumber = $request->input('featured');
            $postId = $request->input('post_id');

            // Begin Transaction
            DB::beginTransaction();

            // Reset existing post with the same featured number
            $existingPost = BlogPost::where('featured', $featuredNumber)
                ->where('id', '!=', $postId)
                ->first();

            if ($existingPost) {
                $existingPost->featured = 0;
                $existingPost->save();
            }

            // Update the incoming post's featured number
            $blogPost = BlogPost::find($postId);
            $blogPost->featured = $featuredNumber;
            $blogPost->save();

            // Commit Transaction
            DB::commit();

            return response()->json([
                'message' => 'Featured number updated successfully',
                'post' => BlogPostResource::make($blogPost),
            ], 200);
        } catch (\Exception $e) {
            // Rollback Transaction
            DB::rollBack();

            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    /**
     * Search for blog posts by title or tags.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function search(Request $request)
    {
        // Validate the request data
        $request->validate([
            'query' => 'required|string',
        ]);

        $query = $request->input('query');

        // Split the query into individual words for tags
        $searchTerms = explode(',', $query);
        $searchTerms = array_map('trim', $searchTerms);
        $searchTerms = array_filter($searchTerms);

        // Build the query
        $blogPosts = BlogPost::where(function ($q) use ($query, $searchTerms) {
            // Search in post_title
            $q->where('post_title', 'LIKE', '%' . $query . '%');

            // Search in post_tags
            $q->orWhere(function ($q) use ($searchTerms) {
                foreach ($searchTerms as $term) {
                    $q->orWhere('post_tags', 'LIKE', '%' . $term . '%');
                }
            });
        })
            // ->get();
            ->paginate(10);

        return response()->json([
            'message' => 'Search results',
            'count' => $blogPosts->count(),
            'posts' => $blogPosts,
        ], 200);
    }

    public function AllBlogCategory()
    {

        $category = BlogCategory::latest()->get();

        return response()->json([
            'count' => $category->count(),
            'categories' => $category
        ]);
    }

    // get blog categories with posts count
    public function AllBlogCategoryWithCount()
    {
        $categories = BlogCategory::withCount('blogPosts')->get();

        return response()->json([
            'count' => $categories->count(),
            'categories' => $categories
        ]);
    }

    public function StoreBlogCategory(Request $request)
    {

        BlogCategory::insert([

            'category_name' => $request->category_name,
            'category_slug' => strtolower(str_replace(' ', '-', $request->category_name)),
        ]);

        return response()->json([
            'message' => 'Category created successfully',
        ]);
    }

    public function UpdateBlogCategory(Request $request)
    {

        $cat_id = $request->cat_id;

        BlogCategory::findOrFail($cat_id)->update([

            'category_name' => $request->category_name,
            'category_slug' => strtolower(str_replace(' ', '-', $request->category_name)),
        ]);

        return response()->json([
            'message' => 'Category updated successfully',
        ]);
    }

    public function DeleteBlogCategory($id)
    {

        BlogCategory::findOrFail($id)->delete();

        return response()->json([
            'message' => 'Category deleted successfully',
        ]);
    }

    public function GetBlogCategory($id)
    {

        $category = BlogCategory::findOrFail($id);

        return response()->json([
            'message' => 'success',
            'category' => $category
        ]);
    }

    public function GetBlogPostByCategory($id)
    {

        $posts = BlogPost::where('blogcat_id', $id)->get();
        $name = BlogCategory::where('id', $id)->first();

        return response()->json([
            'message' => 'success',
            'count' => $posts->count(),
            'data' => BlogPostResource::collection($posts),
            'name' =>  $name->category_name
        ]);
    }

    public function GetBlogPostByUser($id)
    {

        $posts = BlogPost::where('user_id', $id)->get();

        return response()->json([
            'message' => 'success',
            'count' => $posts->count(),
            'posts' => $posts
        ]);
    }

    public function GetBlogPostByTag($tag)
    {

        $posts = BlogPost::where('post_tags', 'LIKE', '%' . $tag . '%')->get();

        return response()->json([
            'message' => 'success',
            'count' => $posts->count(),
            'posts' => $posts
        ]);
    }



    /*
        Here return just the BlogPostResource instead of the BlogCollection with pagination data as we are not paginating the results. Unlike the index method, we are not paginating the results here.
    */
    public function GetFeaturedBlogPosts()
    {
        $posts = BlogPost::with(['user.photoStaff', 'cat'])
            ->where('featured', '>', 0)
            ->get();

        return response()->json([
            'message' => 'success',
            'count' => $posts->count(),
            'posts' => BlogPostResource::collection($posts),
        ]);
    }

    // get all blogs that are not featured
    public function GetNonFeaturedBlogPosts()
    {
        $posts = BlogPost::with(['user.photoStaff', 'cat'])
            ->where('featured', '<', 1)
            ->get();

        return response()->json([
            'count' => $posts->count(),
            'posts' => BlogPostResource::collection($posts),
        ]);
    }



    public function GetRecentBlogPost()
    {

        $posts = BlogPost::latest()->get();

        return response()->json([
            'message' => 'success',
            'count' => $posts->count(),
            'posts' => $posts
        ]);
    }

    // go through all the blog posts and return an array of the unique users
    // public function GetBlogPostAuthors()
    // {
    //     $users = BlogPost::all()->unique('user_id')->pluck('user_id');

    //     $authors = User::whereIn('id', $users)->get();

    //     return response()->json([
    //         'message' => 'success',
    //         'count' => $authors->count(),
    //         'authors' => $authors
    //     ]);
    // }

    public function GetBlogPostAuthors()
    {
        $authors = User::whereHas('blogPosts')
            ->withCount('blogPosts')
            ->with('role', 'photoStaff')
            ->addSelect('id', 'name', 'email', 'role_id', 'photoStaff_id')
            ->get()
            ->makeHidden(['updated_at', 'created_at', 'email_verified_at', 'password', 'remember_token', 'position_id', 'is_active']);

        return response()->json([
            'message' => 'success',
            'authors_count' => $authors->count(),
            'blog_authors' => $authors
        ]);
    }
}
