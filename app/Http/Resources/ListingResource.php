<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ListingResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'street' => $this->street,
            'price' => $this->price,
            'beds' => $this->beds,
            'baths' => $this->baths,
            'sqft' => $this->sqft,
            'main_photo' => $this->main_photo,
            'city_name' => $this->city->name,
            'featured' => $this->featured,
            'state_abbr' => $this->state->abbrev,
            'fullpic_path' => $this->fullpic ? $this->fullpic->file : null,
            'created_at' => $this->created_at_formatted,
            'updated_at' => $this->updated_at_formatted,
            'category' => new ListingCategoryResource($this->whenLoaded('category')),
            'user' => [
                'id' => $this->user->id,
                'name' => $this->user->name,
                'email' => $this->user->email,
                'bio' => $this->user->bio,
                'facebook' => $this->user->facebook,
                'twitter' => $this->user->twitter,
                'photo_staff_file' => $this->user->photoStaff ? $this->user->photoStaff->file : null,
            ],
        ];
    }
}
