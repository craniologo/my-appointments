<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use JwtAuth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
            
        if (Auth::guard('api')->attempt($credentials)) {
            $user = Auth::guard('api')->user();            
            $jwt = JwtAuth::generateToken($user);
            $error = false;
            
            // Return successfull sign in response with the generated jwt.
            $data = compact('user', 'jwt');
            return compact('error', 'data');
        } else {

            // Return response for failed attempt...
            $error = true;
            $message = 'Invalid credentials';
            return compact('error', 'message');
        }
    }
}
