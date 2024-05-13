<?php
namespace App\Http\Controllers\API;

use App\Models\JobApplication;
use App\Http\Requests\JobApplicationRequest;
use App\Http\Controllers\API\BaseController as BaseController;

class JobApplicationController extends BaseController
{
    public function store(JobApplicationRequest $request)
    {
        // Check if the user is a recruiter
        $userRole = auth()->user()->role;
    
        if ($userRole === 'recruiter') {
            return response()->json(['message' => 'Recruiters cannot apply for jobs'], 422);
        }
    
        // Check if the job application already exists for the user
        $existingApplication = JobApplication::where('job_id', $request->job_id)
                                             ->where('user_id', auth()->user()->id)
                                             ->first();
    
        if ($existingApplication) {
            return response()->json(['message' => 'Job application already exists'], 422);
        }
    
        // Create a new job application if the user is not a recruiter and the application doesn't already exist
        JobApplication::create([
            'job_id' => $request->job_id,
            'user_id' => auth()->user()->id,
        ]);
    
        return response()->json(['message' => 'Job application submitted successfully']);
    }
}