<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jobposts extends Model
{
    use HasFactory;

    protected $table = 'job_posts';

    protected $fillable = [
        'title', // Add 'title' to allow mass assignment
        'description',
        'location',
        'company_name',
        'company_email',
        'salary',
        'role',
        'detail_req',
        'commitment'
        // Add other fields as needed
    ];
}
