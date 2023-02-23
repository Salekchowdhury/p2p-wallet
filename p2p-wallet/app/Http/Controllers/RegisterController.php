<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function register(Request $request){
        $user  =  new User;

        $rules = [
            'name'     => 'required',
            'email'    => 'required|email|unique:users',
            'password' => [
                'required',
                'string',
                'min:10',             // must be at least 10 characters in length
                'regex:/[a-z]/',      // must contain at least one lowercase letter
                'regex:/[A-Z]/',      // must contain at least one uppercase letter
                'regex:/[0-9]/',      // must contain at least one digit
                'regex:/[@$!%*#?&]/', // must contain a special character
            ]
        ];



        $validation = \Validator::make( $request->input(), $rules);

        if ( $validation->fails() ) {

            return response()->json([
                'status' => 422,
                'errors' => $validation->errors()->all()
            ]);
        }

        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $save = $user->save();
        if (!$save){
            App::abort(500, 'Some Error');
        }

        return response()->json([
                "status"=> 200,
                "success" => "Account Created Successfully",

        ]);
    }
}
