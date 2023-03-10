<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\CreditController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::post("/login",[LoginController::class,"login"]);
Route::post("/register",[RegisterController::class,"register"]);

Route::get("rate",[LoginController::class,'rate']);



Route::group(['middleware' => ['auth:sanctum']], function() {

    Route::put("/update",[LoginController::class,"update"]);
    Route::get("/search/{name}",[LoginController::class,"search"]);
});

