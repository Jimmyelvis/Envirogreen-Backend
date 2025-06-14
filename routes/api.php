<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\AuthController;
use App\Models\Listing;
use App\Http\Controllers\ListingController;
use App\Http\Controllers\StaffController;
use App\Http\Controllers\AdminListingsController;
use App\Http\Controllers\AdminUsersController;
use App\Http\Controllers\WishlistController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\AdminCityController;
use App\Http\Controllers\AdminStateController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\SavedSearchController;
use App\Http\Controllers\SettingsController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


// Public routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// ----- Listings routes
Route::get('/listings/featured', [ListingController::class, 'featuredListings']);
Route::get('/listings/notfeatured', [ListingController::class, 'notfeaturedListings']);
Route::get('/listings/search/{query}', [ListingController::class, 'locationSearch']);
Route::get('/listings/multisearch', [ListingController::class, 'multiresults'])->name('listings.multisearch');
Route::get('/listings', [ListingController::class, 'index']);
Route::get('/listings/count', [ListingController::class, 'count']);
Route::get('/listings/{id}', [ListingController::class, 'show'])->name('listings.show');
Route::get('listings/nearby/{cityId}/{excludeId}', [ListingController::class, 'nearbyListings']);
Route::get('/listings/locationsearch/{query}', [ListingController::class, 'getLocationResultsFromQuery']);

// ----- Category routes
Route::get('/categories', [CategoryController::class, 'index']);


// ----- Blog routes
Route::get('/blogs/search', [BlogController::class, 'search']);
Route::get('/blogs/categories', [BlogController::class, 'AllBlogCategoryWithCount']);
Route::get('/blogs/categoryposts/{id}', [BlogController::class, 'GetBlogPostByCategory']);
Route::get('/blogs/featured', [BlogController::class, 'GetFeaturedBlogPosts']);
Route::get('/blogs/notfeatured', [BlogController::class, 'GetNonFeaturedBlogPosts']);
Route::get('/blogs/authors', [BlogController::class, 'GetBlogPostAuthors']);
Route::post('/blogs/category', [BlogController::class, 'StoreBlogCategory']);
Route::get('/blogs/category/{id}', [BlogController::class, 'GetBlogCategory']);
Route::get('/blogs', [BlogController::class, 'index']);
Route::get('/blogs/count', [BlogController::class, 'count']);
Route::get('/blogs/{id}', [BlogController::class, 'show']);


// ----- Staff routes
Route::get('/staff', [StaffController::class, 'index']);
Route::get('/staff/{id}', [StaffController::class, 'show']);

// ----- City routes
Route::get('/cities', [AdminCityController::class, 'index']);
Route::get('/cities/{stateId}', [AdminCityController::class, 'getCitiesFromState']);
Route::get('/cities/suggestions/{query}', [AdminCityController::class, 'getCitiesFromQuery']);


// ----- State routes
Route::get('/states', [AdminStateController::class, 'index']);

// testing only
Route::post('/admin/listings', [AdminListingsController::class, 'store']);
Route::get('/admin/usersagents', [AdminUsersController::class, 'showUserAgents']);
Route::put('/admin/listings/{id}', [AdminListingsController::class, 'update']);
Route::get('/admin/getcitieswithlistings', [AdminListingsController::class, 'getCitiesWithListings']);
Route::get('admin/getTopCitiesWithListings', [AdminListingsController::class, 'getTopCitiesWithListings']);
Route::get('/admin/getstateswithlistings', [AdminListingsController::class, 'getStatesWithListings']);
Route::put('/admin/staff/{id}/role', [AdminUsersController::class, 'changeRole']);



// settings routes
Route::get('/admin/settings', [SettingsController::class, 'index']);
Route::put('/admin/settings/changeheaderimage', [SettingsController::class, 'changeheaderimage']);
Route::put('/admin/settings/featuredpostsslots', [SettingsController::class, 'changefeaturedpostslots']);
Route::put('/admin/settings/featuredlistingsslots', [SettingsController::class, 'changefeaturedlistingslots']);

Route::get('/admin/roles', [AdminUsersController::class, 'showRoles']);

// Route::post('/admin/blog/set-featured', [BlogController::class, 'setFeatured']);


// Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post('/logout', [AuthController::class, 'logout']);

    // ----- Listings routes
    // Route::post('/admin/listings', [AdminListingsController::class, 'store']);

    Route::get('/admin/listings', [AdminListingsController::class, 'index']);
    Route::delete('/admin/listings/{id}', [AdminListingsController::class, 'destroy']);

    // ----- Staff routes
    Route::get('/admin/staff', [AdminUsersController::class, 'index'])
        ->middleware('check.role');

    Route::get('/admin/staff/{id}', [AdminUsersController::class, 'show'])
        ->middleware('check.role');

    Route::put('/admin/staff/{id}', [AdminUsersController::class, 'update'])->middleware('check.self');



    Route::post('/admin/blog/create', [BlogController::class, 'store']);
    Route::put('/admin/blog/{id}', [BlogController::class, 'update']);
    Route::delete('/admin/blog/{id}', [BlogController::class, 'destroy']);

    Route::post('/admin/blog/set-featured', [BlogController::class, 'setFeatured']);
    Route::post('/admin/listing/set-featured', [ListingController::class, 'setFeatured']);

    Route::post('/admin/listings/addcity', [AdminCityController::class, 'store']);

    // create a route for getting user wishlist using WishlistController
    Route::get('/user/wishlist', [WishlistController::class, 'UserWishlist']);
    Route::post('/add-to-wishList/{property_id}', [WishlistController::class, 'AddToWishList']);
    Route::delete('/wishlist/{property_id}', [WishlistController::class, 'removeFromWishlist']);

    // create a route for getting user saved searches
    Route::get('/user/saved-searches', [SavedSearchController::class, 'index']);
    Route::post('/user/saved-searches', [SavedSearchController::class, 'store']);
    Route::put('/user/saved-searches/{id}', [SavedSearchController::class, 'update']);
    Route::delete('/user/saved-searches/{id}', [SavedSearchController::class, 'destroy']);

    Route::get('/current-user', [AdminUsersController::class, 'getCurrentUser'])->middleware('auth:sanctum');
});

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
