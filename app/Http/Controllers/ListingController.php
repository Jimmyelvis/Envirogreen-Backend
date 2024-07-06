<?php

namespace App\Http\Controllers;

use App\Models\Listing;
use App\Models\User;
use App\Models\City;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;

use App\Http\Requests;

class ListingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listings = Listing::with(['user', 'fullpic', 'extrapicone', 'extrapictwo', 'extrapicthree', 'extrapicfour'])
            ->get()
            ->map(function ($listing) {
                // Append file paths as new attributes
                //    $listing->user_name = $listing->user->name ? : null;
                // Append file paths as new attributes
                $listing->user_role = $listing->user && $listing->user->role ? $listing->user->role->name : null;

                $listing->user_position = $listing->user && $listing->user->position ? $listing->user->position->name : null;

                $listing->user_photo_path = $listing->user && $listing->user->photoStaff ? $listing->user->photoStaff->file : null;

                $listing->fullpic_path = $listing->fullpic ? $listing->fullpic->file : null;
                $listing->extrapicone_path = $listing->extrapicone ? $listing->extrapicone->file : null;
                $listing->extrapictwo_path = $listing->extrapictwo ? $listing->extrapictwo->file : null;
                $listing->extrapicthree_path = $listing->extrapicthree ? $listing->extrapicthree->file : null;
                $listing->extrapicfour_path = $listing->extrapicfour ? $listing->extrapicfour->file : null;
                $listing->city_name = $listing->city ? $listing->city->name : null;
                $listing->state_name = $listing->state ? $listing->state->name : null;
                return $listing;
            });

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


    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        $listing = Listing::find($id);

        if (!$listing) {
            return response()->json(['message' => 'Listing not found'], 404);
        }

        $listing = Listing::with(['user', 'fullpic', 'extrapicone', 'extrapictwo', 'extrapicthree', 'extrapicfour'])
            ->where('id', $id)
            ->get()
            ->map(function ($listing) {
                // Append file paths as new attributes
                //    $listing->user_name = $listing->user->name ? : null;
                // Append file paths as new attributes
                $listing->user_role = $listing->user && $listing->user->role ? $listing->user->role->name : null;

                $listing->user_position = $listing->user && $listing->user->position ? $listing->user->position->name : null;

                $listing->user_photo_path = $listing->user && $listing->user->photoStaff ? $listing->user->photoStaff->file : null;

                $listing->fullpic_path = $listing->fullpic ? $listing->fullpic->file : null;
                $listing->extrapicone_path = $listing->extrapicone ? $listing->extrapicone->file : null;
                $listing->extrapictwo_path = $listing->extrapictwo ? $listing->extrapictwo->file : null;
                $listing->extrapicthree_path = $listing->extrapicthree ? $listing->extrapicthree->file : null;
                $listing->extrapicfour_path = $listing->extrapicfour ? $listing->extrapicfour->file : null;
                $listing->city_name = $listing->city ? $listing->city->name : null;
                $listing->state_name = $listing->state ? $listing->state->name : null;
                return $listing;
            });

        return response()->json($listing);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function locationSearch($q)
    {
        if (!$q) {
            return response()->json(['message' => 'No search query provided'], 400);
        }

        $listings = Listing::join('cities', 'listings.city_id', '=', 'cities.id')
                           ->join('states', 'listings.state_id', '=', 'states.id') // Adjusted join for states
                           ->select('listings.*', 'cities.name as city_name', 'states.name as state_name', 'states.abbrev as state_abbrev')
                           ->where('cities.name', 'LIKE', '%' . $q . '%')
                            ->orWhere('states.name', 'LIKE', '%' . $q . '%')
                           ->get();

        return response()->json([
            'query' => $q,
            'count' => count($listings),
            'listings' => $listings,
        ]);
    }

    public function featuredListings(Request $request)
    {
        // get listings where featured is greater than 0
        $listings = Listing::where('featured', '>', 0)
            ->get()
            ->map(function ($listing) {
                // Append file paths as new attributes
                $listing->user_name = $listing->user->name ? : null;
                $listing->fullpic_path = $listing->fullpic ? $listing->fullpic->file : null;
                $listing->extrapicone_path = $listing->extrapicone ? $listing->extrapicone->file : null;
                $listing->extrapictwo_path = $listing->extrapictwo ? $listing->extrapictwo->file : null;
                $listing->extrapicthree_path = $listing->extrapicthree ? $listing->extrapicthree->file : null;
                $listing->extrapicfour_path = $listing->extrapicfour ? $listing->extrapicfour->file : null;
                $listing->city_name = $listing->city ? $listing->city->name : null;
                $listing->state_name = $listing->state ? $listing->state->name : null;
                return $listing;
            });

        return response()->json([
            'count' => count($listings),
            'listings' => $listings,
        ]);
    }

    public function multiresults(Request $request)
    {
        // Retrieve filters from the request
        $loc = $request->input('loc');
        $min = $request->input('min');
        $max = $request->input('max');
        $cat = $request->input('cat');

        // Start building the query
        $query = Listing::query();

        if ($min !== null && $max !== null) {
            $query->whereBetween('price', [(int)$min, (int)$max]);
        }

        if ($loc !== null) {
            $query->where('city_id', '=', (int)$loc);
        }

        if ($cat !== null) {
            $query->where('category_id', '=', (int)$cat);
        }

        // Execute the query and get results
        $listings = $query->get();

        // Check if listings were found
        if ($listings->isEmpty()) {
            return response()->json(['message' => 'No listings found matching your criteria'], 404);
        }

        return response()->json([
            'queryDetails' => ['loc' => $loc, 'min' => $min, 'max' => $max, 'cat' => $cat],
            'count' => $listings->count(),
            'listings' => $listings
        ]);
    }


}
