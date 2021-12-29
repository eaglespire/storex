<?php

use Illuminate\Support\Facades\Request;
use App\Providers\RouteServiceProvider;

if(!function_exists('set_active')){
    //this function handles active menu items
    function set_active( $route ) {
        if( is_array( $route ) ){
            return in_array(Request::path(), $route) ? 'menu-active' : '';
        }
        return Request::path() == $route ? 'menu-active' : '';
    }
}

if(!function_exists('checkCurrentRoute')){
    //this function handles active menu items
    function checkCurrentRoute($route){
       return  request()->routeIs($route) ? 'active': '';
    }
}

if (!function_exists('set_redirect')){
    //redirects based on user role
    function set_redirect(){
        switch (Auth::user()->role){
            case 'admin':
                return RouteServiceProvider::ADMIN_PATH;
                break;
            case 'user':
                return RouteServiceProvider::HOME_PATH;
                break;
            default:
                return RouteServiceProvider::LOGIN_PATH;
        }
    }
}

if (!function_exists('show_correct_dashboard')){
    //Correct dashboard to show
    function show_correct_dashboard(){
        if (auth()->user()->role == 'admin'){
            return route('dashboard');
        }
        else{
            return route('home');
        }
    }
}
