<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use auth;
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
    public function rate()
    {

        $curl = curl_init();
        $EUR = 'EUR';
        $USD = 'USD';
        $amount = 25;
        curl_setopt_array($curl, array(
        CURLOPT_URL => "https://api.apilayer.com/fixer/convert?to={$EUR}&from={$USD}&amount={$amount}",
        CURLOPT_HTTPHEADER => array(
            "Content-Type: text/plain",
            "apikey: zkBm7ouW6Pn84PhPMH40SKhPCee99gzY"
        ),
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "GET"
        ));

        $response = json_decode(curl_exec($curl));

        // $response = $response->info;
        curl_close($curl);
        // $responsed =json_decode($response);
        echo $response->result;
        // return response()->json([
        //     "data"=>  $response->success
        // ]);
    }



}
