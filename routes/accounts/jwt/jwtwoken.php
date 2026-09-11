<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/jwttoken', function (Request $request) {
    $request->validate([
        'username' => ['required', 'string'],
        'password' => ['required', 'string'],
    ]);

    return response()->json([
        'access' => 'mock_access_token',
        'refresh' => 'mock_refresh_token',
    ]);
});
