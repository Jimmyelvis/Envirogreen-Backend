<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;


class CheckRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::check()) {
            return response()->json(['error' => 'Authentication required'], 401);
        }

        // Convert string of roles to array
        // $rolesArray = explode(',', $roles);
        $rolesArray = array('Admin', 'SuperAdmin', 'Agent', 'Sales');


        $incomingRole = array(Auth::user()->role->name);


            // Log::info('role name',Auth::user()->role->name);
            Log::info('check roles:', $incomingRole);
            Log::info('check roles:', $rolesArray);

        if (!in_array(Auth::user()->role->name, $rolesArray)) {
            return response()->json(['error' => 'Access Denied'], 403);
        }

        return $next($request);
    }
}
