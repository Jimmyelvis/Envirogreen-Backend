<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Models\City;

class AdminCityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $cities = City::all()
            ->map(function ($city) {
                // Append file paths as new attributes
                $city->state_name = $city->state ? $city->state->name : null;
                return $city;
            });

        return response()->json([
            'count' => count($cities),
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

        City::create($request->all());

        return redirect('/admin/cities');

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
