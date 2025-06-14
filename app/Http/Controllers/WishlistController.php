<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Wishlist;
use Carbon\Carbon;
use App\Models\Listing;
use App\Http\Resources\WishlistResource;

class WishlistController extends Controller
{

    // Get User's Wishlist, find the property_id from Wishlist table and match with Listing table by id and return the data



    public function UserWishlist(){

        try {
            $wishlist = Wishlist::where('wishlists.user_id', Auth::user()->id)
                ->join('listings', 'listings.id', '=', 'wishlists.property_id')
                ->select('listings.*', 'wishlists.*') // Specify columns if needed to avoid fetching unnecessary data
                ->get();
            return response()->json(WishlistResource::collection($wishlist));
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }






    }

    public function AddToWishList(Request $request, $property_id){

        if(Auth::check()){

            $exists = Wishlist::where('user_id', Auth::user()->id)->where('property_id',$property_id)->first();

            if (!$exists) {
                Wishlist::insert([
                'user_id' => Auth::id(),
                'property_id' => $property_id,
                'created_at' => Carbon::now()
                ]);
                return response()->json(
                    [
                        'success' => 'Successfully Added On Your Wishlist'
                    ]);
            }else{
                return response()->json(['error' => 'This Property Has Already in your WishList']);
            }

        }else{
            return response()->json(['error' => 'At First Login Your Account']);
        }


    }

    public function removeFromWishlist($property_id)
    {
        if (Auth::check()) {
            try {
                $deleted = Wishlist::where('user_id', Auth::id())
                    ->where('property_id', $property_id)
                    ->delete();

                if ($deleted) {
                    return response()->json(['success' => 'Successfully removed from your wishlist']);
                } else {
                    return response()->json(['error' => 'Item not found in your wishlist'], 404);
                }
            } catch (\Exception $e) {
                return response()->json(['error' => 'An error occurred while removing the item'], 500);
            }
        } else {
            return response()->json(['error' => 'Please login to your account first'], 401);
        }
    } // End Method

}
