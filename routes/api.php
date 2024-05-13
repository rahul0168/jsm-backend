<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\API\JobController;
use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\API\JobPostingController;
use App\Http\Controllers\API\UserProfileController;
use App\Http\Controllers\API\JobApplicationController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Apply CORS middleware to all API routes
Route::middleware('cors')->group(function () {

    Route::post('register', [RegisterController::class, 'register']);
    Route::post('login', [RegisterController::class, 'login']);

    // Job Listings
    Route::get('/job-listings', [JobController::class,'index']);
    Route::get('/job-listings/{id}', [JobController::class,'show']);
    Route::get('/jobs/filter', [JobController::class, 'filter']);    

    Route::middleware('auth:api')->group( function () {
        
       
        // Job Applications
        Route::post('/job-applications', [JobApplicationController::class,'store']);
    
        // Job Posting
        Route::post('/job-postings', [JobPostingController::class,'store']);
        Route::get('/job-postings/edit/{id}', [JobPostingController::class,'edit']);
        Route::put('/job-postings/{id}', [JobPostingController::class,'update']);
        Route::get('/job-postings/list/{id}', [JobPostingController::class,'list']);
        Route::delete('/job-postings/delete/{userid}/{id}', [JobPostingController::class,'delete']);

    
        // User Profile
        Route::get('/user-profile', [UserProfileController::class,'show']);
        Route::put('/user-profile', [UserProfileController::class,'update']);
    
    });
});
