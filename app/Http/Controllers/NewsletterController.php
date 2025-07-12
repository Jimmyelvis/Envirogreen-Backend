<?php

namespace App\Http\Controllers;

use App\Models\Newsletter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class NewsletterController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        try {
            $newsletters = Newsletter::all();
            return response()->json($newsletters);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'email:rfc,dns', 'max:255'],  // Strict email validation including DNS check
        ], [
            'email.required' => 'Email is required',
            'email.email' => 'Email must be a valid email address',
            'email.max' => 'Email must not exceed 255 characters',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        $newsletter = Newsletter::create($request->all());

        return response()->json([
            'message' => 'You have been successfully subscribed to our newsletter',
            'newsletter' => $newsletter
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Newsletter $newsletter)
    {
        //
        try {
            $newsletter = Newsletter::find($newsletter->id);
            return response()->json($newsletter);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Newsletter $newsletter)
    {
        //
        try {
            $newsletter = Newsletter::find($newsletter->id);
            $newsletter->update($request->all());
            return response()->json([
                'message' => 'Newsletter updated successfully',
                'newsletter' => $newsletter
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Newsletter $newsletter)
    {
        //
            try {
            $newsletter = Newsletter::find($newsletter->id);
            $newsletter->delete();
            return response()->json([
                'message' => 'Newsletter deleted successfully',
                'newsletter' => $newsletter
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ]);
        }
    }
}
