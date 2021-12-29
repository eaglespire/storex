<?php

namespace App\Http\Middleware;

use App\Providers\RouteServiceProvider;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class User
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::check()){
            return redirect()->route('login');
        }
        switch (Auth::user()->role){
            case 'admin':
                return redirect()->route(RouteServiceProvider::ADMIN);
                break;
            case 'user':
                return $next($request);
                break;
            default:
                return redirect()->route('login');
        }
    }
}
