<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Deposit;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Auth;
use DB;

class UserController extends Controller
{

public function index()
{
   $users= User::where('role', '!=', 'super-admin')->get();

   return response()->json([
    "users" => $users,
   ]);
}
public function usersList()
{
   $users= User::where('role', '=', 'customer')->get();

   return response()->json([
    "users" => $users,
   ]);
}
public function store(Request $request)
{
    $user =new User();

    $rules = [
        'name'     => 'required',
        'role'     => 'required',
        'currency'     => 'required',
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
            'status'=> 200,
            'errors' => $validation->errors()->all()
        ]);
    }

    $user->name = $request->name;
    $user->role = $request->role;
    $user->currency = $request->currency;
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

public function show(int $id)
{
    $user = User::findOrFail($id);
    return response()->json([
        'user'=>$user
    ]);
}
public function edit(int $id)
{
    $user = User::findOrFail($id);
    return response()->json([
        'user'=>$user,
    ]);
}
public function update(Request $request, int $id)
{
    $user = User::findOrFail($id);

        if($user){
            $user->name= $request->name;
            $user->email= $request->email;
            $user->role= $request->role;
            $user->currency= $request->currency;
            $user->update();
            return response()->json([
                'status'=> 200,
                'message'=> 'Updated Data Successfully'
            ]);
        }else{
            return response()->json([
                'status'=> 404,
                'message'=> 'Not User Id Found',
            ],404);
        }

}
public function logout()
{
    Session::flush();

    Auth::logout();
    // localStorage.removeItem(role);
    // localStorage.removeItem(id);
     return response()->json([
        'status'=> 200,
     ]);
}
public function delete(int $id)
{
    $user = User::findOrFail($id);
    if($user){
     $user->delete();
     return response()->json([
        'status'=> 200,
        'message'=> 'Deleted Data Successfully'
    ]);
    }else{
        return response()->json([
            'status'=> 404,
            'message'=> 'Not User Id Found',
        ],404);
    }
}

public function topTransaction()
{
    $data = Deposit::groupBy('sender_id')
    ->selectRaw('sum(balance) as total, sender_id')
    ->limit(3)
    ->with(['deposits'])
    ->first();
    // $data = DB::table('deposits')
    // ->select('sender_id',DB::raw('sum(balance) as total'))
    // ->groupBy('sender_id')
    // ->take(3)
    // ->get();

return response()->json([
    'data'=>$data,
    'user'=>$data->deposits->name
]);
}
public function topThreeTransaction()
{
    $data = Deposit::groupBy('sender_id')
    ->selectRaw('sum(balance) as total, sender_id')
    ->limit(3)
    ->get();
    // $data = DB::table('deposits')
    // ->select('sender_id',DB::raw('sum(balance) as total'))
    // ->groupBy('sender_id')
    // ->take(3)
    // ->get();

return response()->json([
    'data'=>$data,
    // 'user'=>$data->deposits->name
]);
}

}
