<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Cache\RateLimiter;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ContactFormRateLimit
{
    protected $limiter;

    public function __construct(RateLimiter $limiter)
    {
        $this->limiter = $limiter;
    }

    public function handle(Request $request, Closure $next): Response
    {
        $key = 'contact-form:' . $request->ip();

        // Allow 10 submissions per IP address per hour
        if ($this->limiter->tooManyAttempts($key, 10)) {
            return response()->json([
                'message' => 'Too many contact form submissions. Please try again later.',
            ], 429);
        }

        $this->limiter->hit($key, 3600); // Keep record for 1 hour

        return $next($request);
    }
}
