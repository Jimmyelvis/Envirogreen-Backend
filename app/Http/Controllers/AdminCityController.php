<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator; // Add this line

use App\Http\Requests;
use App\Models\City;
use App\Models\State;
use App\http\Resources\SearchresultsResource;

class AdminCityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */


    public function index()
    {
        // Retrieve and sort cities with their associated states
        $cities = City::with('state')
            ->orderBy('name')
            ->get()
            ->map(function ($city) {
                // Append state name as a new attribute
                $city->state_name = $city->state ? $city->state->name : null;
                return $city;
            });

        return response()->json([
            'count' => $cities->count(),
            'cities' => $cities,
        ]);
    }


    public function getCitiesWithListings()
    {
        $cities = City::with('listings')->get();

        return response()->json([
            'count' => count($cities),
            'cities' => $cities,
        ]);
    }

    public function getCitiesFromState($stateId)
    {
        $cities = City::where('state_id', $stateId)
            ->orderBy('name', 'asc')
            ->get();

        return response()->json([
            'count' => count($cities),
            'cities' => $cities,
        ]);
    }

    public function getCitiesFromQuery($query)
    {
        $cities = City::where('name', 'like', '%' . $query . '%')
            ->orderBy('name', 'asc')
            ->get();

        return response()->json([
            'count' => count($cities),
            'cities' => $cities,
            'query' => $query,
        ]);
    }

    // get cities from query and the listings associated with them, and the count of listings

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
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $city = City::findOrFail($id);

        return view('admin.cities.edit', compact('cities'));
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
        $city = City::findOrFail($id);

        $city->update($request->all());

        return redirect('/admin/cities');
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
        City::findOrFail($id)->delete();

        return redirect('/admin/cities');
    }
}
