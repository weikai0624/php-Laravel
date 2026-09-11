<?php

use Illuminate\Support\Facades\Route;

Route::prefix('accounts')->group(function () {
    require __DIR__.'/accounts/api.php';
});
