<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class CheckSelf
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string  $userIdParameter  The name of the route parameter that contains the user ID.
     * @return mixed
     */
    public function handle(Request $request, Closure $next, $userIdParameter = 'id')
    {
        if (!Auth::check()) {
            return response()->json(['error' => 'Authentication required'], 401);
        }

        // create roles array
        $rolesArray = array('Admin', 'SuperAdmin', 'Founder');
        $incomingRole = array(Auth::user()->role->name);

        $userId = $request->route($userIdParameter);

        // // Log::info('role name',Auth::user()->role->name);
        // Log::info('check self:', $incomingRole);
        // Log::info('check self:', $rolesArray);

        if (Auth::id() != $userId && !in_array(Auth::user()->role->name, $rolesArray)) {
            return response()->json(['error' => 'Access Denied'], 403);
        }

        return $next($request);
    }
}
