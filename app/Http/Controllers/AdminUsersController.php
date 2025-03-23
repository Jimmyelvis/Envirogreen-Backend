<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\PhotoStaff;
use App\Models\Photo;
use App\Models\Role;
use App\Models\Position;
use App\Models\Listing;
use App\Http\Requests\UserRequest;
use App\Http\Requests\UsersEditRequest;
use App\Http\Requests;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class AdminUsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //

        try {

            $users = User::all();

            return response()->json([
                'count' => count($users),
                'users' => $users,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $roles = Role::lists('name', 'id')->all();
        $positions = Position::lists('name', 'id')->all();
        return view('admin.users.create', compact('roles', 'positions'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UserRequest $request)
    {
        //return $request->all();

        // User::create($request->all());

        //Request of the entire form

        if (trim($request->password) == '') {

            $input = $request->except('password');
        } else {

            $input = $request->all();

            $input['password'] = bcrypt($request->password);
        }

        $input = $request->all();

        if ($file = $request->file('photo_id')) {

            $name = time() . $file->getClientOriginalName();
            $file->move('images/people', $name);
            $photo = PhotoStaff::create(['file' => $name]);

            $input['photo_id'] = $photo->id;
        }

        $input['password'] = bcrypt($request->password);

        User::create($input);

        return redirect('/admin/users');

        // return redirect('admin/users');
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function show($id)
    // {
    //     try {

    //         $user = User::find($id);


    //         if (!$user) {
    //             return response()->json(['message' => 'User not found'], 404);
    //         }

    //         $user = User::with(['role', 'position', 'photoStaff'])
    //             ->where('id', $id)
    //             // get any Listing associated with this user from the Listing model and put it in an array and return file paths as new attributes, and city name associated city_id from the City model
    //             ->get()
    //             ->map(function ($user) {
    //                 $user->role_name = $user->role ? $user->role->name : null;
    //                 $user->position_name = $user->position ? $user->position->name : null;
    //                 $user->photo_path = $user->photoStaff ? $user->photoStaff->file : null;
    //                 $user->listings = $user->listings->map(function ($listing) {
    //                     $listing->fullpic_path = $listing->fullpic ? $listing->fullpic->file : null;
    //                     $listing->extrapicone_path = $listing->extrapicone ? $listing->extrapicone->file : null;
    //                     $listing->extrapictwo_path = $listing->extrapictwo ? $listing->extrapictwo->file : null;
    //                     $listing->extrapicthree_path = $listing->extrapicthree ? $listing->extrapicthree->file : null;
    //                     $listing->state_name = $listing->state ? $listing->state->name : null;
    //                     $listing->city_name = $listing->city ? $listing->city->name : null;
    //                     return $listing;
    //                 });
    //                 return $user;
    //             })


    //             ->first();

    //         return response()->json([
    //             'user' => $user,
    //         ]);
    //     }

    //     catch (\Exception $e) {
    //         return response()->json([
    //             'error' => $e->getMessage(),
    //         ]);
    //     }
    // }


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


    // function to all users whose role is either agent, admin or superadmin
    public function showUserAgents()
    {
        try {
            $users = User::with(['role', 'position', 'photoStaff', 'listings'])
                ->where('role_id', 1)
                ->orWhere('role_id', 2)
                ->orWhere('role_id', 5)
                ->get();

            $usersData = $users->map(function ($user) {
                return [
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
            });

            return response()->json($usersData);
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

    // public function changeUser(Request $request, $id)
    // {
    //     try {
    //         $user = User::find($id);

    //         if (!$user) {
    //             return response()->json(['message' => 'User not found'], 404);
    //         }

    //         $user->update($request->all());

    //         $userData = [
    //             'id' => $user->id,
    //             'name' => $user->name,
    //             'email' => $user->email,
    //             'skype' => $user->skype,
    //             'phone' => $user->phone,
    //             'facebook' => $user->facebook,
    //             'twitter' => $user->twitter,
    //             'bio' => $user->bio,
    //             'role_name' => $user->role ? $user->role->name : null,
    //             'position_name' => $user->position ? $user->position->name : null,
    //             'photo_path' => $user->photoStaff ? $user->photoStaff->file : null,
    //             'listings' => $user->listings->map(function ($listing) {
    //                 return [
    //                     'id' => $listing->id,
    //                     'street' => $listing->street,
    //                     'city_name' => $listing->city ? $listing->city->name : null,
    //                     'state_name' => $listing->state ? $listing->state->name : null,
    //                     'price' => $listing->price,
    //                     'beds' => $listing->beds,
    //                     'baths' => $listing->baths,
    //                     'sqft' => $listing->sqft,
    //                     'fullpic_path' => $listing->fullpic ? $listing->fullpic->file : null,
    //                     'extrapicone_path' => $listing->extrapicone ? $listing->extrapicone->file : null,
    //                     'extrapictwo_path' => $listing->extrapictwo ? $listing->extrapictwo->file : null,
    //                     'extrapicthree_path' => $listing->extrapicthree ? $listing->extrapicthree->file : null,
    //                     'extrapicfour_path' => $listing->extrapicfour ? $listing->extrapicfour->file : null,
    //                     'extaphotos' => $listing->extraphotos,
    //                     'main_photo' => $listing->main_photo,
    //                     'descrip    ' => $listing->descrip,
    //                     'Updated_at' => $listing->updated_at,
    //                     'Created_at' => $listing->created_at,
    //                     'Category_id' => $listing->category ? $listing->category->name : null,
    //                 ];
    //             })->toArray()
    //         ];

    //         return response()->json([
    //             'message' => 'User role updated successfully',
    //             'user' => $userData
    //         ]);
    //     } catch (\Exception $e) {
    //         return response()->json(['error' => $e->getMessage()], 500);
    //     }
    // }

    public function changeRole(Request $request, $id)
    {
        try {
            // Authorization check (if needed)
            // $this->authorize('updateRole', User::class);

            // Validate the request data
            $validator = Validator::make($request->all(), [
                'role_id' => 'required|exists:roles,id',
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            // Find the user by ID
            $user = User::find($id);

            if (!$user) {
                return response()->json(['message' => 'User not found'], 404);
            }

            // Update the user's role
            $user->role_id = $request->input('role_id');
            $user->save();

            // Load the role relationship
            $user->load('role');

            // Prepare the updated user data
            // $userData = [
            //     'id' => $user->id,
            //     'name' => $user->name,
            //     'email' => $user->email,
            //     'role_name' => $user->role ? $user->role->name : null,
            //     // Include other fields as needed
            // ];

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
                'role_id' => $user->role ? $user->role->id : null,
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

            // Return a success response with updated user data
            return response()->json([
                'message' => 'User role updated successfully',
                'user' => $userData
            ]);
        } catch (\Exception $e) {
            // Handle any unexpected errors
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }


    // list all roles from the roles table
    public function showRoles()
    {
        try {
            $roles = Role::all();

            return response()->json([
                'count' => count($roles),
                'roles' => $roles,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ]);
        }
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

        try {
            // $user = User::find($id);

            $user = User::with(['role', 'position', 'photoStaff', 'listings'])
                ->find($id);

            if (!$user) {
                return response()->json(['message' => 'User not found'], 404);
            }

            $user->update($request->all());

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

            return response()->json([
                'message' => 'User updated successfully',
                'user' => $userData
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
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
        $user = User::findOrFail($id);

        unlink(public_path() .  $user->photo->file);

        $user->delete();

        // Session::flash('deleted_user','The user has been deleted');

        return redirect('/admin/users');
    }

    public function getCurrentUser()
    {
        try {
            $user = Auth::user();
            
            if (!$user) {
                return response()->json(['message' => 'Not authenticated'], 401);
            }

            $user->load(['role', 'position', 'photoStaff', 'listings', 'wishlist.listing']);
            
            $userData = [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'skype' => $user->skype,
                'phone' => $user->phone,
                'facebook' => $user->facebook,
                'twitter' => $user->twitter,
                'bio' => $user->bio,
                'role_name' => $user->role?->name,
                'position_name' => $user->position?->name,
                'photo_path' => $user->photoStaff?->file,
                'listings' => $user->listings->map(fn($listing) => [
                    'id' => $listing->id,
                    'street' => $listing->street,
                    'city_name' => $listing->city?->name,
                    'state_name' => $listing->state?->name,
                    'price' => $listing->price
                ]),
                'wishlist' => $user->wishlist->map(fn($item) => [
                    'id' => $item->listing->id,
                    'street' => $item->listing->street,
                    'price' => $item->listing->price,
                    'main_photo' => $item->listing->fullpic?->file
                ])
            ];

            return response()->json(['user' => $userData]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
