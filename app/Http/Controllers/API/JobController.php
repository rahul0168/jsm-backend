<?php
namespace App\Http\Controllers\API;

use App\Models\Jobposts;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Resources\JobResource;
use App\Http\Controllers\API\BaseController as BaseController;

class JobController extends BaseController
{
    public function index(Request $request)
    {
        $query = Jobposts::query();

    if ($request->filled('category')) {
        $query->where('category', $request->category);
    }

    if ($request->filled('location')) {
        $query->where('location', $request->location);
    }

    if ($request->filled('keywords')) {
        $keywords = Str::of($request->keywords)->explode(',');
        $query->where(function ($query) use ($keywords) {
            foreach ($keywords as $keyword) {
                $query->orWhere('title', 'like', "%$keyword%")
                      ->orWhere('description', 'like', "%$keyword%");
            }
        });
    }

    $jobs = $query->get();

    return response()->json(['data'=>$jobs]);
    }

    public function show($id)
    {
        $job = Jobposts::findOrFail($id);
        return new JobResource($job);
    }

    public function filter(Request $request)
    {
        $query = Jobposts::query();

        if ($request->has('category')) {
            $query->where('category', $request->category);
        }
    
        if ($request->has('location')) {
            $query->where('location', $request->location);
        }
    
        if ($request->has('keywords')) {
            $keywords = explode(',', $request->keywords);
            foreach ($keywords as $keyword) {
                $query->orWhere('title', 'like', "%$keyword%")
                      ->orWhere('description', 'like', "%$keyword%");
            }
        }
    
        // Pagination and limit
        $page = $request->has('page') ? $request->page : 1;
        $limit = $request->has('limit') ? $request->limit : 10;
        $jobs = $query->paginate($limit, ['*'], 'page', $page);
        $totalCount = $jobs->total(); // Get the total count

        return response()->json([
            'jobs' => $jobs,
            'total_count' => $totalCount,
        ]);
    }
}