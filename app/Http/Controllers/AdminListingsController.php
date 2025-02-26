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
use App\Http\Resources\ListingResource;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Illuminate\Support\Facades\DB;


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
        $catagories = Category::lists('name', 'id')->all();
        $states = State::lists('name', 'id')->all();
        $cities = City::lists('name', 'id')->all();
        $users = User::lists('name', 'id', 'photo_id')->all();
        return view('admin.listings.create', compact('catagories', 'cities', 'states', 'users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    // public function store(Request $request)
    // {
    //     try {

    //         $validated = $request->validate([
    //             'price' => 'required|numeric',
    //             'category_id' => 'required|numeric',
    //             'city_name' => 'required|string',
    //             'state_id' => 'required|exists:states,id', // Ensure state_id exists in states table
    //             'extraphotos' => 'nullable|json',
    //             'beds' => 'required|numeric',
    //             'baths' => 'required|numeric',
    //             'sqft' => 'required|numeric',
    //             'main_photo' => 'required|string',
    //             'descrip' => 'required|string',
    //             'user_id' => 'required|numeric',
    //             'street' => 'required|string',
    //         ]);

    //         // Check if the city already exists
    //         $city = City::firstOrCreate([
    //             'name' => $validated['city_name'],
    //             'state_id' => $validated['state_id']
    //         ]);

    //         // Create the listing with the new or found city_id
    //         $listingData = array_merge($validated, ['city_id' => $city->id]);
    //         $listing = new Listing($listingData);
    //         $listing->save();

    //         return response()->json([
    //             'message' => 'Listing created successfully',
    //             'listing' => $listing
    //         ], 201);
    //     } catch (\Exception $e) {
    //         return response()->json(['error' => $e->getMessage()], 500);
    //     }
    // }

    public function store(Request $request)
    {
        // Validate the incoming request data
        $validator = Validator::make($request->all(), [
            'price' => 'required|numeric',
            'category_id' => 'required|numeric',
            'city_name' => 'required|string',
            'state_id' => 'required|exists:states,id', // Ensure state_id exists in states table
            // 'extraphotos' => 'nullable|json',
            'beds' => 'required|numeric',
            'baths' => 'required|numeric',
            'sqft' => 'required|numeric',
            // 'main_photo' => 'required|string',
            'descrip' => 'required|string',
            'user_id' => 'required|numeric',
            'street' => 'required|string',
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()->all() // Return all validation errors
            ], 422); // 422 Unprocessable Entity
        }

        try {
            // Check if the city already exists
            $city = City::firstOrCreate([
                'name' => $request->city_name,
                'state_id' => $request->state_id
            ]);

            // Create the listing with the new or found city_id
            $listingData = array_merge($request->all(), ['city_id' => $city->id]);
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

            // $validated = $request->validate([
            //     'price' => 'required|numeric',
            //     'category_id' => 'required|numeric',
            //     'city_name' => 'required|string',
            //     'state_id' => 'required|exists:states,id', // Ensure state_id exists in states table
            //     'extraphotos' => 'nullable|json',
            //     'beds' => 'required|numeric',
            //     'baths' => 'required|numeric',
            //     'sqft' => 'required|numeric',
            //     'descrip' => 'required|string',
            //     'user_id' => 'required|numeric',
            //     'street' => 'required|string',
            // ]);

            // Validate the incoming request data
            $validator = Validator::make($request->all(), [
                'price' => 'required|numeric',
                'category_id' => 'required|numeric',
                'city_name' => 'required|string',
                'state_id' => 'required|exists:states,id', // Ensure state_id exists in states table
                // 'extraphotos' => 'nullable|json',
                'beds' => 'required|numeric',
                'baths' => 'required|numeric',
                'sqft' => 'required|numeric',
                'main_photo' => 'required|string',
                'descrip' => 'required|string',
                'user_id' => 'required|numeric',
                'street' => 'required|string',
            ]);

            // Check if validation fails
            if ($validator->fails()) {
                return response()->json([
                    'errors' => $validator->errors()->all() // Return all validation errors
                ], 422); // 422 Unprocessable Entity
            }

            // If extrapicone_path, extrapictwo_path, extrapicthree_path, extrapicfour_path are null, or empty, clear the entry in the database
            if (empty($request->extrapicone_path)) {
                $listing->extrapicone_id = null;
            }
            if (empty($request->extrapictwo_path)) {
                $listing->extrapictwo_id = null;
            }
            if (empty($request->extrapicthree_path)) {
                $listing->extrapicthree_id = null;
            }
            if (empty($request->extrapicfour_path)) {
                $listing->extrapicfour_id = null;
            }


            // Check if the city already exists or create a new one
            $city = City::firstOrCreate([
                'name' => $request->city_name,
                'state_id' => $request->state_id
            ]);

            // Update the listing with the new or found city_id
            $listingData = array_merge($request->all(), ['city_id' => $city->id]);
            $listing->update($listingData);

            return response()->json([
                'message' => 'Listing updated successfully',
                'listing' => $listing
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }


    public function getCitiesWithListings(Request $request)
    {

        $order = $request->input('order', 'desc');
        $uniqueCitiesCount = DB::table('listings')->distinct('city_id')->count('city_id');

        // $listingsPerCity = DB::table('listings')
        // ->join('cities', 'listings.city_id', '=', 'cities.id')
        // ->whereNotNull('listings.city_id')
        // ->groupBy('listings.city_id', 'cities.name')
        // ->select('listings.city_id', 'cities.name', DB::raw('count(*) as total'))
        // ->orderBy('total', 'desc')
        // ->get();

        // Get the number of listings per city along with city and state names
        $listingsPerCity = DB::table('listings')
            ->join('cities', 'listings.city_id', '=', 'cities.id')
            ->join('states', 'cities.state_id', '=', 'states.id')
            ->whereNotNull('listings.city_id')
            ->groupBy('listings.city_id', 'cities.name', 'states.name', 'states.abbrev')
            ->select('listings.city_id', 'cities.name as city_name', 'states.name as state_name', 'states.abbrev as state_abbrev', DB::raw('count(*) as total'))
            ->orderBy('total', $order)
            ->get();

        return response()->json([
            'Total_Cities' => $uniqueCitiesCount,
            'Per_City' => $listingsPerCity,
        ]);
    }

    // Get top 5 cities with the most listings
    public function getTopCitiesWithListings(Request $request)
    {
        $order = $request->input('order', 'desc');

        $uniqueCitiesCount = DB::table('listings')->distinct('city_id')->count('city_id');

        $listingsPerCity = DB::table('listings')
            ->join('cities', 'listings.city_id', '=', 'cities.id')
            ->join('states', 'cities.state_id', '=', 'states.id')
            ->whereNotNull('listings.city_id')
            ->groupBy('listings.city_id', 'cities.name', 'states.name', 'states.abbrev' )
            ->select('listings.city_id', 'cities.name as city_name', 'states.name as state_name', 'states.abbrev as state_abbrev', DB::raw('count(*) as total'))
            ->orderBy('total', $order)
            ->limit(5)
            ->get();

        return response()->json([
            'Per_City' => $listingsPerCity,
            'Total_Cities' => $uniqueCitiesCount,
        ]);
    }

    public function getStatesWithListings(Request $request)
    {

        $order = $request->input('order', 'desc');

        $uniqueStatesCount = DB::table('listings')->distinct('state_id')->count('state_id');


        $listingsPerState = DB::table('listings')
            ->join('states', 'listings.state_id', '=', 'states.id')
            ->whereNotNull('listings.state_id')
            ->groupBy('listings.state_id', 'states.name', 'states.abbrev')
            ->select('listings.state_id', 'states.name', 'states.abbrev', DB::raw('count(*) as total'))
            ->orderBy('total', $order)
            ->get();

        return response()->json([
            'Per_State' => $listingsPerState,
            'Total_States' => $uniqueStatesCount,
        ]);
    }


    // Add a new city to the cities table must include state_id
    public function addCity(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'state_id' => 'required|exists:states,id'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()->all()
            ], 422);
        }

        try {
            $city = City::firstOrCreate([
                'name' => $request->name,
                'state_id' => $request->state_id
            ]);

            return response()->json([
                'message' => 'City added successfully',
                'city' => $city
            ], 201);
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
