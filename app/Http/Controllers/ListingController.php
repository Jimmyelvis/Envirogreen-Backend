<?php

namespace App\Http\Controllers;

use App\Models\Listing;
use App\Models\User;
use App\Models\City;
use App\Models\State;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\http\Resources\SearchresultsResource;
use Illuminate\Support\Facades\Validator;


use App\Http\Requests;
use App\Http\Resources\ListingCollection;
use App\Http\Resources\ListingExtendedResource;
use App\Http\Resources\ListingResource;
use Illuminate\Support\Facades\Auth;

class ListingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // Retrieve filters from the request
        $sortValue = $request->input('sort', 'latest');
        $limit = $request->input('limit', 5);
        $sortBy = $request->input('sort_by', 'created_at');
        $orderBy = $request->input('order_by', 'desc');

        $sort = 'desc';
        if ($sortValue === 'latest') {
            $sort = 'desc';
        } else if ($sortValue === 'oldest') {
            $sort = 'asc';
        }

        // Ensure that $sort only accepts valid values ('asc' or 'desc') to prevent SQL injection or errors.
        if (!in_array($sort, ['asc', 'desc'])) {
            $sort = 'desc';
        }


        $query = Listing::with(['user', 'user.photoStaff', 'city', 'state', 'fullpic', 'extrapicone', 'extrapictwo', 'extrapicthree', 'extrapicfour']);

        $listings = $query
            ->orderBy($sortBy, $sort)
            ->limit($limit)
            ->get();

        $listings = $listings->map(function ($listing) {
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
            $listing->state_abbrev = $listing->state ? $listing->state->abbrev : null;
            $listing->listing_type = $listing->category ? $listing->category->name : null;
            return $listing;
        });



        return response()->json([
            'count' => $listings->count(),
            'listings' => $listings,
        ]);
    }


    public function count()
    {
        $listings = Listing::all();
        $count = count($listings);
        return response()->json($count);
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

        $listing = Listing::with(['user', 'fullpic', 'extrapicone', 'extrapictwo', 'extrapicthree', 'extrapicfour'])
            ->where('id', $id)
            ->first();

        if (!$listing) {
            return response()->json(['message' => 'Listing not found'], 404);
        }

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

        return response()->json($listing); // Return the listing object directly
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

    public function locationSearch($query)
    {
        if (!$query) {
            return response()->json(['message' => 'No search query provided'], 400);
        }

        $listings = Listing::join('cities', 'listings.city_id', '=', 'cities.id')
            ->join('states', 'listings.state_id', '=', 'states.id') // Adjusted join for states
            ->select('listings.*', 'cities.name as city_name', 'states.name as state_name', 'states.abbrev as state_abbrev')
            ->where('cities.name', 'LIKE', '%' . $query . '%')
            ->orWhere('states.name', 'LIKE', '%' . $query . '%')
            ->get();

        return response()->json([
            'query' => $query,
            'count' => count($listings),
            'listings' => $listings,
        ]);
    }

    public function getLocationResultsFromQuery($query)
    {
        $cities = City::where('name', 'like', '%' . $query . '%')
            ->whereHas('listingsForCity')
            ->with('state')
            ->withCount('listingsForCity')
            ->get();

        $cities = $cities->map(function ($city) {
            $city->listings_count = $city->listingsForCity->count();
            return $city;
        });

        $states = State::where('name', 'like', '%' . $query . '%')
            ->whereHas('listingsForState')
            ->withCount('listingsForState')
            ->get();

        $results = $cities->concat($states);

        return response()->json([
            'count' => count($results),
            'results' => SearchresultsResource::collection($results),
            'query' => $query,
            // 'states' => $states,
        ]);
    }



    public function featuredListings(Request $request)
    {
        // get listings where featured is greater than 0
        // $listings = Listing::where('featured', '>', 0)
        //     ->get()
        //     ->sortBy('featured')
        //     ->map(function ($listing) {
        //         // Append file paths as new attributes
        //         $listing->user_name = $listing->user->name ?: null;
        //         $listing->fullpic_path = $listing->fullpic ? $listing->fullpic->file : null;
        //         $listing->extrapicone_path = $listing->extrapicone ? $listing->extrapicone->file : null;
        //         $listing->extrapictwo_path = $listing->extrapictwo ? $listing->extrapictwo->file : null;
        //         $listing->extrapicthree_path = $listing->extrapicthree ? $listing->extrapicthree->file : null;
        //         $listing->extrapicfour_path = $listing->extrapicfour ? $listing->extrapicfour->file : null;
        //         $listing->city_name = $listing->city ? $listing->city->name : null;
        //         $listing->state_name = $listing->state ? $listing->state->name : null;
        //         $listing->user_photo_path = $listing->user && $listing->user->photoStaff ? $listing->user->photoStaff->file : null;

        //         return $listing;
        //     });

        $listings = Listing::with(['user.photoStaff', 'category', 'city', 'state', 'fullpic'])
            ->where('featured', '>', 0)
            ->orderBy('featured')
            ->get();

        return response()->json([
            'count' => count($listings),
            'listings' => ListingExtendedResource::collection($listings),
        ]);
    }


    public function notfeaturedListings()
    {

        $listings = Listing::with(['user.photoStaff', 'category', 'city', 'state', 'fullpic'])
            ->where('featured', '<', 1)
            ->get();

        return response()->json([
            'count' => count($listings),
            'listings' => ListingResource::collection($listings),
        ]);
    }


    // Set the featured number of a listing
    public function setFeatured(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|integer',
            'featured' => 'required|integer',
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
            $listingId = $request->input('id');

            // Begin Transaction
            DB::beginTransaction();

            // Reset existing post with the same featured number
            $existingListing = Listing::where('featured', $featuredNumber)
                ->where('id', '!=', $listingId)
                ->first();

            if ($existingListing) {
                $existingListing->featured = 0;
                $existingListing->save();
            }

            // Update the incoming post's featured number
            $listing = Listing::find($listingId);
            $listing->featured = $featuredNumber;
            $listing->save();

            // Commit Transaction
            DB::commit();

            /*
            Figure out how to return the updated listing with all the fields we need
            this may be a good place for creating another resource class
            */

            return response()->json([
                'message' => 'Featured number updated successfully',
                'post' => ListingExtendedResource::make($listing),
            ], 200);
        } catch (\Exception $e) {
            // Rollback Transaction
            DB::rollBack();

            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function multiresults(Request $request)
    {
        // Retrieve filters from the request
        $loc = $request->input('loc');
        $state = $request->input('state');
        $min = $request->input('min');
        $max = $request->input('max');
        $cat = $request->input('cat');
        $page = $request->input('page', 1);
        $beds = $request->input('beds');
        $baths = $request->input('baths');
        $sort = $request->input('sort');
        $perPage = $request->input('perpage', 8);

        // Start building the query
        $query = Listing::with(['user', 'fullpic', 'extrapicone', 'extrapictwo', 'extrapicthree', 'extrapicfour']);

        if ($max !== null) {
            $query->where('price', '<=', (int)$max);
        }

        if ($beds !== null) {
            $query->where("beds", ">=", (int)$beds);
        }

        if ($baths !== null) {
            $query->where("baths", ">=", (int)$baths);
        }

        if ($min !== null && $max !== null) {
            $query->whereBetween('price', [(int)$min, (int)$max]);
        }

        if ($loc !== null && $loc !== 0) {
            $query->where('city_id', '=', (int)$loc);
        }

        if ($state !== null && $state !== '') {
            $query->where('state_id', '=', (int)$state);
        }

        if ($cat !== null) {
            $query->where('category_id', '=', (int)$cat);
        }

        if ($sort !== null) {

            if ($sort === "latest-(asc)") {
                $query->orderBy('updated_at', 'asc');
            } else if ($sort === "latest-(desc)") {
                $query->orderBy('updated_at', 'desc');
            } else if ($sort === "price-(asc)") {
                $query->orderBy('price', 'asc');
            } else if ($sort === "price-(desc)") {
                $query->orderBy('price', 'desc');
            } else if ($sort === "beds-(desc)") {
                $query->orderBy('beds', 'desc');
            } else if ($sort === "beds-(asc)") {
                $query->orderBy('beds', 'asc');
            } else if ($sort === "baths-(desc)") {
                $query->orderBy('baths', 'desc');
            } else if ($sort === "baths-(asc)") {
                $query->orderBy('baths', 'asc');
            } else if ($sort === "sqft-(asc)") {
                $query->orderBy('sqft', 'asc');
            } else if ($sort === "sqft-(desc)") {
                $query->orderBy('sqft', 'desc');
            }
        }

        // $query->orderBy('updated_at', 'desc');

        // Execute the query with pagination
        // $listings = $query->paginate($perPage, ['*'], 'page', $page)->through(function ($listing) {
        //     // Append file paths as new attributes
        //     $listing->user_role = $listing->user && $listing->user->role ? $listing->user->role->name : null;
        //     $listing->user_position = $listing->user && $listing->user->position ? $listing->user->position->name : null;
        //     $listing->user_photo_path = $listing->user && $listing->user->photoStaff ? $listing->user->photoStaff->file : null;
        //     $listing->fullpic_path = $listing->fullpic ? $listing->fullpic->file : null;
        //     $listing->extrapicone_path = $listing->extrapicone ? $listing->extrapicone->file : null;
        //     $listing->extrapictwo_path = $listing->extrapictwo ? $listing->extrapictwo->file : null;
        //     $listing->extrapicthree_path = $listing->extrapicthree ? $listing->extrapicthree->file : null;
        //     $listing->extrapicfour_path = $listing->extrapicfour ? $listing->extrapicfour->file : null;
        //     $listing->city_name = $listing->city ? $listing->city->name : null;
        //     $listing->state_name = $listing->state ? $listing->state->name : null;
        //     $listing->listing_type = $listing->category ? $listing->category->name : null;
        //     return $listing;
        // });


        // return response()->json($listings);

        $listings = $query->paginate($perPage, ['*'], 'page', $page);

        return new ListingCollection($listings);

    }

    public function nearbyListings($cityId, $excludeId = null)
    {

        $query = Listing::where('city_id', $cityId);

        if ($excludeId) {
            $query->where('id', '!=', $excludeId);
        }

        $listings = $query
            ->get()
            ->map(function ($listing) {
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
                $listing->state_name = $listing->state ? $listing->state->abbrev : null;
                $listing->listing_type = $listing->category ? $listing->category->name : null;
                return $listing;
            });

        return response()->json([
            'count' => count($listings),
            'listings' => $listings,
        ]);
    }


    // public function multiresults(Request $request)
    // {
    //     // Retrieve filters from the request
    //     $loc = $request->input('loc');
    //     $min = $request->input('min');
    //     $max = $request->input('max');
    //     $cat = $request->input('cat');

    //     // Start building the query
    //     $query = Listing::query();

    //     if ($max !== null) {
    //         $query->where('price', '<=', (int)$max);
    //     }

    //     if ($min !== null && $max !== null) {
    //         $query->whereBetween('price', [(int)$min, (int)$max]);
    //     }

    //     if ($loc !== null) {
    //         $query->where('city_id', '=', (int)$loc);
    //     }

    //     if ($cat !== null) {
    //         $query->where('category_id', '=', (int)$cat);
    //     }

    //     // Execute the query and get results
    //     $listings = $query->get();

    //     // Check if listings were found
    //     if ($listings->isEmpty()) {
    //         return response()->json(['message' => 'No listings found matching your criteria'], 404);
    //     }

    //     return response()->json([
    //         'queryDetails' => ['loc' => $loc, 'min' => $min, 'max' => $max, 'cat' => $cat],
    //         'count' => $listings->count(),
    //         'listings' => $listings
    //     ]);
    // }

}
