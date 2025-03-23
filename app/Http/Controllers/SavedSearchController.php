<?php

namespace App\Http\Controllers;

use App\Models\SavedSearch;
use Illuminate\Http\Request;

class SavedSearchController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $savedSearches = SavedSearch::all();
            return response()->json($savedSearches);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required'
            ]);

            $savedSearch = SavedSearch::create([
                ...$request->all(),
                'user_id' => auth()->id()
            ]);
            return response()->json($savedSearch, 201);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 422);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(SavedSearch $savedSearch)
    {
        try {
            return response()->json($savedSearch);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, SavedSearch $savedSearch)
    {
        try {
            $savedSearch->update($request->all());
            return response()->json($savedSearch);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(SavedSearch $savedSearch)
    {
        try {
            $savedSearch->delete();
            return response()->json(['success' => 'Saved search deleted successfully']);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
