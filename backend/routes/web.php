<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


/*
 * Admin Only Routes
 */
Route::middleware(['auth','admin'])->group(function (){
    Route::get('/mj-network-defuyre-2e4sd-uyiuhyt468gf-wokhgut', function (){
        return view('admin.dashboard');
    })->name('dashboard');
    Route::get('/mj-networks-accounts-ryhuerilojs-289e4rths&984-4445kjhfrf', function (){
        return view('admin.accounts');
    })->name('admin.accounts');
    Route::get('mj.networks/site/_ylt=As6pPqj3t7OBn2LQbZCUU7abvZx4;_ylu=X3oDMTVocThw330824863', function(){
        return view('admin.site-data');
    })->name('admin.site');
});

/*
 * Authentication Routes
 */
Auth::routes(['verify'=> true]);

/*
 * User only Routes
 */
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
