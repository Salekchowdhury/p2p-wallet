<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Deposit;
use App\Models\User;
use App\Models\Credit;
use auth;

class DepositController extends Controller
{
    public function store(Request $request)
    {


        $rules = [
            'balance'     => 'required',
        ];



        $validation = \Validator::make( $request->input(), $rules);

        if ( $validation->fails() ) {

            return response()->json([
                'status' => 422,
                'errors' => $validation->errors()->all()
            ]);
        }


        $userData = User::findOrFail($request->receiver_id);

        $curl = curl_init();
        $from = $userData->currency;
        $to = $request->currency;
        $balance = $request->balance;
        curl_setopt_array($curl, array(
        CURLOPT_URL => "https://api.apilayer.com/fixer/convert?to={$to}&from={$from}&amount={$balance}",
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
        curl_close($curl);



        $deposit = new Deposit();
        $credit = new Credit();
        $creditSavedData =Credit::create([
            'balance' => $response->result,
            'currency' => $request->currency,
            'user_id' => $request->receiver_id,
        ]);

        $deposit->sender_id =$request->sender_id;
        $deposit->receiver_id =$request->receiver_id;
        $deposit->credit_id =$creditSavedData->id;


        $deposit->currency = $request->currency;
        $deposit->balance = $request->balance;
        $deposit->cash_id = $request->cash_id;
        $deposit->cash_out = $request->cash_out;

        $deposit->save();

         return response()->json([
            'status'=>200,
         ]);
    }
}
