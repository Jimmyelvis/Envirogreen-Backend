<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Models\User;

class StaffController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $users = User::all()
            ->map(function ($user) {
                // Append file paths as new attributes
                $user->role_name = $user->role ? $user->role->name : null;
                $user->position_name = $user->position ? $user->position->name : null;
                $user->photo_path = $user->photoStaff ? $user->photoStaff->file : null;
                return $user;
            });

            return response()->json([
                'count' => count($users),
                'staff' => $users,
            ]);

        // $users = User::all();
        // return response()->json([
        //     'count' => count($users),
        //     'staff' => $users,
        // ]);
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
    // updated show method
    public function show($id)
    {
        try {
            $user = User::with(['role', 'position', 'photoStaff', 'listings'])
            ->find($id);

            if (!$user) {
                return response()->json(['message' => 'User not found'], 404);
            }

            $userData = [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'skype' => $user->skype,
                'phone' => $user->phone,
                'facebook' => $user->facebook,
                'twitter' => $user->twitter,
                'bio' => $user->bio,
                'role_name' => $user->role ? $user->role->name : null,
                'position_name' => $user->position ? $user->position->name : null,
                'photo_path' => $user->photoStaff ? $user->photoStaff->file : null,
                'listings' => $user->listings->map(function ($listing) {
                    return [
                        'id' => $listing->id,
                        'street' => $listing->street,
                        'city_name' => $listing->city ? $listing->city->name : null,
                        'state_name' => $listing->state ? $listing->state->name : null,
                        'price' => $listing->price,
                        'beds' => $listing->beds,
                        'baths' => $listing->baths,
                        'sqft' => $listing->sqft,
                        'fullpic_path' => $listing->fullpic ? $listing->fullpic->file : null,
                        'extrapicone_path' => $listing->extrapicone ? $listing->extrapicone->file : null,
                        'extrapictwo_path' => $listing->extrapictwo ? $listing->extrapictwo->file : null,
                        'extrapicthree_path' => $listing->extrapicthree ? $listing->extrapicthree->file : null,
                        'extrapicfour_path' => $listing->extrapicfour ? $listing->extrapicfour->file : null,
                        'extaphotos' => $listing->extraphotos,
                        'main_photo' => $listing->main_photo,
                        'descrip' => $listing->descrip,
                        'Updated_at' => $listing->updated_at,
                        'Created_at' => $listing->created_at,
                        'Category_id' => $listing->category ? $listing->category->name : null,
                    ];
                })->toArray()
            ];

            return response()->json(['user' => $userData]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
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
}
