<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PhotoListing;
use App\Models\ExtraPhotoOne;
use App\Models\ExtraPhotoTwo;
use App\Models\ExtraPhotoThree;
use App\Models\ExtraPhotoFour;
use App\Models\Photo;
use App\Models\Category;
use App\Models\State;
use App\Models\City;
use App\Models\Listing;
use App\Helpers;
use App\Http\Requests\ListingRequest;
use App\Http\Requests\ListingEditRequest;
use App\Http\Requests;
use App\Models\User;

class AdminListingsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listings = Listing::with(['user', 'fullpic', 'extrapicone', 'extrapictwo', 'extrapicthree', 'extrapicfour'])->get();
        return response()->json([
            'count' => count($listings),
            'listings' => $listings,
        ]);
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $catagories = Category::lists('name','id')->all();
        $states = State::lists('name','id')->all();
        $cities = City::lists('name','id')->all();
        $users = User::lists('name','id','photo_id')->all();
        return view('admin.listings.create', compact('catagories', 'cities', 'states','users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

public function store(Request $request)
{
    try {

        $validated = $request->validate([
            'price' => 'required|numeric',
            'category_id' => 'required|numeric',
            'city_name' => 'required|string',
            'state_id' => 'required|exists:states,id', // Ensure state_id exists in states table
            'extraphotos' => 'nullable|json',
            'beds' => 'required|numeric',
            'baths' => 'required|numeric',
            'sqft' => 'required|numeric',
            'descrip' => 'required|string',
            'user_id' => 'required|numeric',
            'street' => 'required|string',
        ]);

        // Check if the city already exists
        $city = City::firstOrCreate([
            'name' => $validated['city_name'],
            'state' => $validated['state_id']
        ]);

        // Create the listing with the new or found city_id
        $listingData = array_merge($validated, ['city_id' => $city->id]);
        $listing = new Listing($listingData);
        $listing->save();

        return response()->json([
            'message' => 'Listing created successfully',
            'listing' => $listing
        ], 201);
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
}





    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }



    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            $listing = Listing::findOrFail($id); // Find the listing or fail with a 404 error

            $validated = $request->validate([
                'price' => 'required|numeric',
                'category_id' => 'required|numeric',
                'city_name' => 'required|string',
                'state_id' => 'required|exists:states,id', // Ensure state_id exists in states table
                'extraphotos' => 'nullable|json',
                'beds' => 'required|numeric',
                'baths' => 'required|numeric',
                'sqft' => 'required|numeric',
                'descrip' => 'required|string',
                'user_id' => 'required|numeric',
                'street' => 'required|string',
            ]);

            // Check if the city already exists or create a new one
            $city = City::firstOrCreate([
                'name' => $validated['city_name'],
                'state' => $validated['state_id']
            ]);

            // Update the listing with the new or found city_id
            $listingData = array_merge($validated, ['city_id' => $city->id]);
            $listing->update($listingData);

            return response()->json([
                'message' => 'Listing updated successfully',
                'listing' => $listing
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $listing = Listing::findOrFail($id);  // Ensures the listing exists or returns a 404 response
            $listing->delete();                  // Deletes the listing

            return response()->json([
                'message' => 'Listing was deleted successfully!'
            ], 200);  // Sends a JSON response with a success message
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500); // Catches any exceptions and returns an error message
        }
    }



}
