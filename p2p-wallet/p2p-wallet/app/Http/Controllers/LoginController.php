<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request){
        $user  =  User::where("email", $request->email)->first();
        $rules = [
            'email'    => 'required|email',
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
        $message = [
            "password.required" => "password must be alpha numeric with at least one special character"
        ];
    
        $validation = \Validator::make( $request->input(), $rules, $message);
    
        if ( $validation->fails() ) {

            return response(['errors' => $validation->errors()->all()],200);
        }

        if (!$user || !Hash::check($request->password,$user->password)){
            return response([
                "message" => "These creadential do not match in our records"
            ],404);
        }
        
        $token = $user->createToken('token')->plainTextToken;

        return \response([
            "token" => $token,
            "user" => $user
        ],200);
    }

    function update(Request $request){
        $user = User::find($request->id);
        $user->name = $request->name;
        $user->save();
        return response([
            "success" => true
        ]);

    }
    function search($name){
        $data = User::where("name","like","%".$name."%")->get();
        return $data;
    }

    
    
}
