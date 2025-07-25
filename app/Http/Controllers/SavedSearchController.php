<?php

namespace App\Http\Controllers;

use App\Models\SavedSearch;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\SavedSearchResource;

class SavedSearchController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $savedSearches = SavedSearch::all();
            return SavedSearchResource::collection($savedSearches);
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
    public function update(Request $request, $id)
    {
        try {
            $savedSearch = SavedSearch::find($id);

            if (!$savedSearch) {
                return response()->json(['message' => 'Saved search not found'], 404);
            }

            // Get the authenticated user's ID
            $user_id = Auth::id();

            if ($savedSearch->user_id !== $user_id) {
                return response()->json([
                    'error' => 'Unauthorized You Need To be the Original Author',
                    'Auth' => $user_id,
                    'SavedSearch User' => $savedSearch->user_id
                ], 403);
            }

            $savedSearch->update($request->all());
            return response()->json($savedSearch);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            $savedSearch = SavedSearch::find($id);

            if (!$savedSearch) {
                return response()->json(['message' => 'Saved search not found'], 404);
            }

            // Get the authenticated user's ID
            $user_id = Auth::id();

             // Ensure the user is authenticated
             if (!$user_id) {
                return response()->json(['error' => 'You need to be logged in'], 401);
            }


            if ($savedSearch->user_id !== $user_id) {
                return response()->json([
                    'error' => 'Unauthorized You Need To be the Original Author',
                    'Auth' => $user_id,
                    'SavedSearch User' => $savedSearch->user_id
                ], 403);
            }

            $savedSearch->delete();
            return response()->json([
                'message' => 'Saved search deleted successfully',
                'id' => (int)$id
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
