<?php

use Illuminate\Support\Facades\Route;
use Dedoc\Scramble\Attributes\Group;

$routeFiles = glob(__DIR__.'/jwt/*.php');

sort($routeFiles);

foreach ($routeFiles as $routeFile) {
    require $routeFile;
};

// require __DIR__.'/jwt/jwtwoken.php';
// require __DIR__.'/jwt/refresh.php';
// require __DIR__.'/jwt/verify.php';