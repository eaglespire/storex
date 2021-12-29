<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    //protected $redirectTo ;
    /*
     * This method overrides the redirectTo property
     * the set_redirect() method is a global helper
     * that redirects users based on their role
     */
    /*public function redirectTo()
    {
        $this->redirectTo = set_redirect();
    }*/
    public function redirectTo() {
        $role = Auth::user()->role;
        switch ($role) {
            case 'admin':
                return RouteServiceProvider::ADMIN_PATH;
                break;
            default:
                return RouteServiceProvider::HOME_PATH;
                break;
        }
    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
}
