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

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


// Public routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// ----- Listings routes
Route::get('/listings/featured', [ListingController::class, 'featuredListings']);
Route::get('/listings/search/{q}', [ListingController::class, 'locationSearch']);
Route::get('/listings/multisearch', [ListingController::class, 'multiresults'])->name('listings.multisearch');
Route::get('/listings', [ListingController::class, 'index']);
Route::get('/listings/{id}', [ListingController::class, 'show'])->name('listings.show');


// ----- Blog routes
Route::get('/blogs', [BlogController::class, 'index']);
Route::get('/blogs/{id}', [BlogController::class, 'show']);

// ----- Staff routes
Route::get('/staff', [StaffController::class, 'index']);
Route::get('/staff/{id}', [StaffController::class, 'show']);




// Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post('/logout', [AuthController::class, 'logout']);

    // ----- Listings routes
    Route::post('/admin/listings', [AdminListingsController::class, 'store']);
    Route::put('/admin/listings/{id}', [AdminListingsController::class, 'update']);
    Route::get('/admin/listings', [AdminListingsController::class, 'index']);
    Route::delete('/admin/listings/{id}', [AdminListingsController::class, 'destroy']);

    // ----- Staff routes
    Route::get('/admin/staff', [AdminUsersController::class, 'index'])
        ->middleware('check.role');

    Route::get('/admin/staff/{id}', [AdminUsersController::class, 'show'])
        ->middleware('check.role');

    Route::put('/admin/staff/{id}', [AdminUsersController::class, 'update'])->middleware('check.self');

    Route::post('/add-to-wishList/{property_id}', [WishlistController::class, 'AddToWishList']);
    Route::get('/wishlist', [WishlistController::class, 'UserWishlist']);


    // User WishlistAll Route
    // Route::controller(WishlistController::class)->group(function () {

    //     Route::get('/user/wishlist', 'UserWishlist')->name('user.wishlist');
    //     Route::get('/get-wishlist-property', 'GetWishlistProperty');
    //     Route::get('/wishlist-remove/{id}', 'WishlistRemove');
    // });
});



Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
