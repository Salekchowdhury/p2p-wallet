<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\CreditController;
use App\Http\Controllers\DepositController;

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

Route::get("/logout",[UserController::class,"logout"]);

Route::post("/login",[LoginController::class,"login"]);
Route::get("rate",[LoginController::class,'rate']);

Route::post("/register",[RegisterController::class,"register"]);

Route::get("/users",[UserController::class,"index"]);
Route::get("/usersList",[UserController::class,"usersList"]);
Route::post("/users",[UserController::class,"store"]);
Route::get("/users/{id}",[UserController::class,"show"]);
Route::get("/users/{id}/edit",[UserController::class,"edit"]);
Route::put("/users/{id}/edit",[UserController::class,"update"]);
Route::delete("/users/{id}/delete",[UserController::class,"delete"]);

Route::get("/topTransaction",[UserController::class,"topTransaction"]);
Route::get("/topThreeTransaction",[UserController::class,"topThreeTransaction"]);

Route::get("/deposits",[DepositController::class,"index"]);
Route::post("/deposit",[DepositController::class,"store"]);





Route::group(['middleware' => ['auth:sanctum']], function() {

    Route::put("/update",[LoginController::class,"update"]);
    Route::get("/search/{name}",[LoginController::class,"search"]);
});

