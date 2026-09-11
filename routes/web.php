<?php

use Illuminate\Support\Facades\Route;
use Dedoc\Scramble\Scramble;

Scramble::registerUiRoute('docs');
Scramble::registerJsonSpecificationRoute('docs.json');
// Route::get('/', function () {
//     return view('welcome');
// });
Route::get('/', function () {
    return redirect('/docs');
});