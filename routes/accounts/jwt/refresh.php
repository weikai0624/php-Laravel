<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/jwttoken/refresh', function (Request $request) {
    $request->validate([
        'refresh' => ['required', 'string'],
    ]);

    return response()->json([
        'access' => 'mock_access_token',
    ]);
});
