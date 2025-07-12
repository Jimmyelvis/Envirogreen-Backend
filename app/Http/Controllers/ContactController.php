<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ContactController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        try {
            $contacts = Contact::all();
            return response()->json($contacts);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Store a newly created resource in storage.
     * Protect from overposting, and injection attacks
     */
    public function store(Request $request)
    {
        // Strict validation rules
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255', 'regex:/^[\p{L}\s\-\.]+$/u'],  // Only letters, spaces, hyphens, dots
            'email' => ['required', 'email:rfc,dns', 'max:255'],  // Strict email validation including DNS check
            'message' => ['required', 'string', 'max:5000', 'not_regex:/<script[^>]*>/'],  // Prevent script tags
        ], [
            'name.regex' => 'Name can only contain letters, spaces, hyphens, and dots',
            'message.not_regex' => 'Message contains invalid content'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        // Only allow specific fields and sanitize input
        $sanitizedData = [
            'name' => strip_tags($request->input('name')),
            'email' => filter_var($request->input('email'), FILTER_SANITIZE_EMAIL),
            'message' => strip_tags($request->input('message'))
        ];

        $contact = Contact::create($sanitizedData);

        // if contact is created successfully, return success message
        if ($contact) {
            return response()->json([
                'message' => 'Contact created successfully',
                'contact' => $contact
            ]);
        }

        // if contact is not created successfully, return error message
        return response()->json([
            'message' => 'Contact not created successfully',
            'contact' => $contact
        ], 500);
    }

    /**
     * Display the specified resource.
     */
    public function show(Contact $contact)
    {
        //
        try {
            $contact = Contact::find($contact->id);
            return response()->json($contact);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Contact $contact)
    {
        //
        try {
            $contact = Contact::find($contact->id);
            $contact->update($request->all());
            return response()->json([
                'message' => 'Contact updated successfully',
                'contact' => $contact
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
    public function destroy(Contact $contact)
    {
        //
        try {
            $contact = Contact::find($contact->id);
            $contact->delete();
            return response()->json([
                'message' => 'Contact deleted successfully',
                'contact' => $contact
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ]);
        }
    }
}
