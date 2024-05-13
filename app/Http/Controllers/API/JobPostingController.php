<?php
namespace App\Http\Controllers\API;

use App\Models\Jobposts;
use App\Http\Requests\JobPostingRequest;
use App\Http\Controllers\API\BaseController as BaseController;

class JobPostingController extends BaseController
{
    public function store(JobPostingRequest $request)
    {
        $job = new Jobposts();
        $job->title = $request->title;
        $job->company_name = $request->company_name;
        $job->company_email = $request->company_email;
        $job->user_id = $request->user_id;
        
      
        
        $job->role = $request->role;
        $job->description = $request->description;
        $job->location = $request->location;
        $job->Salary = $request->Salary;
        $job->detail_req = $request->detail_req;
        $job->commitment = $request->commitment;
        // Additional validation and processing
        $job->save();

        return response()->json(['message' => 'Job posted successfully']);
    }

    public function update(JobPostingRequest $request, $id)
    {
        $job = Jobposts::findOrFail($id);
        $validatedData = $request->validated();
        
        $job->fill($validatedData);

        $job->save();
        return response()->json(['message' => 'Job updated successfully']);

    }

    public function edit($id)
    {
        $job = Jobposts::findOrFail($id);
        return response()->json(['data'=>$job]);
    }

    public function list($id)
    {
        $jobs = Jobposts::where('user_id', $id)->get();
        return response()->json(['data' => $jobs]);
    }

    public function delete($userId, $jobId)
    {
        $job = Jobposts::where('user_id', $userId)->where('id', $jobId)->first();

        if (!$job) {
            return response()->json(['message' => 'Job post not found'], 404);
        }

        $job->delete();
        return response()->json(['message' => 'Job post deleted successfully'], 200);
    }


}