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
        }

        catch (\Exception $e) {
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
        $roles = Role::lists('name','id')->all();
        $positions = Position::lists('name','id')->all();
        return view('admin.users.create', compact('roles','positions'));
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

        if(trim($request->password) == ''){

            $input = $request->except('password');

          }else{

            $input = $request->all();

            $input['password'] = bcrypt($request->password);

          }

        $input = $request->all();

        if($file = $request->file('photo_id')) {

          $name = time() . $file->getClientOriginalName();
          $file->move('images/people', $name);
          $photo = PhotoStaff::create(['file'=>$name]);

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
}
