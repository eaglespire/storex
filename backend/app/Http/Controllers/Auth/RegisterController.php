<?php

namespace App\Http\Controllers\Auth;

use App\Events\UserRegisteredEvent;
use App\Http\Controllers\Controller;
use App\Mail\WelcomeMail;
use App\Models\Blockchain;
use App\Notifications\UserWelcomeNotification;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    //protected $redirectTo;

    /*
     * This method overrides the redirectTo property
     * the set_redirect() method is a global helper
     * that redirects users based on their role
     */
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
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
         $user =User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);
         //Mail::to($data['email'])->send(new WelcomeMail($user));
        /*
         * Send a welcome email to the new user
         */
        $delay = now()->addMinutes(1);
        //$user->notify(new UserWelcomeNotification());
        //$user->notify((new UserWelcomeNotification())->delay($delay));
         return $user;
        //$accounts = Blockchain::all();
        //$account =$accounts->first();
        // emit a userRegistered event
        //event(new UserRegisteredEvent($user));
        //return $user;
    }
}
