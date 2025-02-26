<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BlogPostResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'post_title' => $this->post_title,
            'short_descp' => $this->short_descp,
            // 'long_descp' => $this->long_descp,
            'featured' => $this->featured,
            // 'post_slug' => $this->post_slug,
            'created_at' => $this->created_at_formatted,
            'updated_at' => $this->updated_at_formatted,
            'post_tags' => $this->post_tags,
            'post_image' => $this->post_image,
            'category' => new CategoryResource($this->whenLoaded('cat')),
            'user' => [
                'id' => $this->user->id,
                'name' => $this->user->name,
                'email' => $this->user->email,
                // 'bio' => $this->user->bio,
                // 'facebook' => $this->user->facebook,
                // 'twitter' => $this->user->twitter,
                'avatar' => $this->user->photoStaff ? $this->user->photoStaff->file : null,
            ],
        ];
    }
}
