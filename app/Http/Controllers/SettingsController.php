<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Settings; // Import the Settings model

class SettingsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //

        $settings = Settings::find(1);

        return response()->json([
            'header_image' => $settings->header_image,
            'featured_posts_slots' => $settings->featured_posts_slots,
            'featured_listings_slots' => $settings->featured_listings_slots
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /*
      Function to change the image for the homepage slider. Accepts a string as a parameter, which is the URL of the image to be used.
    */
    public function changeheaderimage(Request $request)
    {

        $url = $request->url;
        $settings = Settings::find(1);
        $settings->header_image = $url;
        $settings->save();

        return response()->json([
            'message' => 'Image updated successfully',
            'image' => $url
        ]);
    }

    /*
      Function to change the number of slots for featured posts. Accepts an integer as a parameter, which is the number of slots to be used. Validates the input to ensure it is a number, and it is between 1 and 5.
    */
    public function changefeaturedpostslots(Request $request)
    {

        $slots = $request->slots;

        if (!is_numeric($slots)) {
            return response()->json([
                'message' => 'Slots must be a number'
            ], 400);
        }

        if ($slots < 1 || $slots > 5) {
            return response()->json([
                'message' => 'Slots must be between 1 and 5'
            ], 400);
        }

        $settings = Settings::find(1);
        $settings->featured_posts_slots = $slots;
        $settings->save();

        return response()->json([
            'message' => 'Featured post slots updated successfully',
            'slots' => $slots
        ]);
    }


     /*
      Function to change the number of slots for featured listings. Accepts an integer as a parameter, which is the number of slots to be used. Validates the input to ensure it is a number, and it is between 1 and 5.
    */
    public function changefeaturedlistingslots(Request $request)
    {

        $slots = $request->slots;

        if (!is_numeric($slots)) {
            return response()->json([
                'message' => 'Slots must be a number'
            ], 400);
        }

        if ($slots < 1 || $slots > 5) {
            return response()->json([
                'message' => 'Slots must be between 1 and 5'
            ], 400);
        }

        $settings = Settings::find(1);
        $settings->featured_listings_slots = $slots;
        $settings->save();

        return response()->json([
            'message' => 'Featured listing slots updated successfully',
            'slots' => $slots
        ]);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
