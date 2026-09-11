<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/jwttoken/verify', function (Request $request) {
    $request->validate([
        'token' => ['required', 'string'],
    ]);

    return response()->json((object) []);
});
