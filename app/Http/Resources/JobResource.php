<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class JobResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'company_name' => $this->company_name,
            'location' => $this->location,
            'posted_date' => $this->created_at->toDateString(),
            'company_logo' => $this->company_logo, // Assuming $this->company_logo contains the image URL or path
            'role' => $this->role,
            'description' => $this->description,
            'detail_req' => $this->detail_req,
            'salary' => $this->salary,
            'commitment' => $this->commitment,
        ];
    }
}
