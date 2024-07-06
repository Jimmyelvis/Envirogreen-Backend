<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Wishlist;
use Carbon\Carbon;
use App\Models\Listing;

class WishlistController extends Controller
{

    // Get User's Wishlist, find the property_id from Wishlist table and match with Listing table by id and return the data



    public function UserWishlist(){

        try {
            $wishlist = Wishlist::where('wishlists.user_id', Auth::id())
                ->join('listings', 'listings.id', '=', 'wishlists.property_id')
                ->select('listings.*', 'wishlists.*') // Specify columns if needed to avoid fetching unnecessary data
                ->get();
            return response()->json($wishlist);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }




        // $wishlist = Wishlist::where('user_id',Auth::id())
        //                     ->join('listings','listings.id','=','wishlists.property_id')
        //                     ->get();
        // return response()->json($wishlist);



    }

    // public function UserWishlist(){
    //     $wishlist = Wishlist::where('user_id',Auth::id())->get();
    //     $data = [];
    //     foreach ($wishlist as $key => $value) {
    //         $data[] = Listing::where('id',$value->property_id)->first();
    //     }
    //     return response()->json($data);
    // }



    //
    public function AddToWishList(Request $request, $property_id){

        if(Auth::check()){

            $exists = Wishlist::where('user_id',Auth::id())->where('property_id',$property_id)->first();

            if (!$exists) {
                Wishlist::insert([
                'user_id' => Auth::id(),
                'property_id' => $property_id,
                'created_at' => Carbon::now()
                ]);
                return response()->json(['success' => 'Successfully Added On Your Wishlist']);
            }else{
                return response()->json(['error' => 'This Property Has Already in your WishList']);
            }

        }else{
            return response()->json(['error' => 'At First Login Your Account']);
        }


    } // End Method

}
