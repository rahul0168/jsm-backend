<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class JobPostingRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title' => 'required|string',
            'company_name' => 'required|string',
            'company_email' => 'required|email',
            'role' => 'required|string',
            'description' => 'required|string',
            'location' => 'required|string',
            'detail_req' => 'required|string',
            'salary' => 'required|string',
            'commitment' => 'required|string',
            'user_id' => 'required|string',
            // Add more validation rules as needed
        ];
    }
}
