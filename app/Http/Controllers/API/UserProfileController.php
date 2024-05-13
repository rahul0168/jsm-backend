<?php
namespace App\Http\Controllers\API;

use App\Http\Resources\UserProfileResource;
use App\Http\Controllers\API\BaseController as BaseController;

class UserProfileController extends BaseController
{
    public function show()
    {
        $user = auth()->user();
        return new UserProfileResource($user);
    }

    public function update(Request $request)
    {
        $user = auth()->user();
        // Update user profile logic
        $user->save();

        return response()->json(['message' => 'User profile updated successfully']);
    }
}