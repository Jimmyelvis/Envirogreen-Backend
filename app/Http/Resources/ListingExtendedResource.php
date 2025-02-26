<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ListingExtendedResource extends JsonResource
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
            'street' => $this->street,
            'price' => $this->price,
            'beds' => $this->beds,
            'baths' => $this->baths,
            'sqft' => $this->sqft,
            'main_photo' => $this->main_photo,
            'city_name' => $this->city->name,
            'featured' => $this->featured,
            'state_name' => $this->state->name,
            'state_abbr' => $this->state->abbrev,
            'fullpic_path' => $this->fullpic ? $this->fullpic->file : null,
            'extrapicone' => $this->extrapicone ? $this->extrapicone->file : null,
            'extrapictwo' => $this->extrapictwo ? $this->extrapictwo->file : null,
            'descrip' => $this->descrip,
            'extrapicthree' => $this->extrapicthree ? $this->extrapicthree->file : null,
            'extrapicfour' => $this->extrapicfour ? $this->extrapicfour->file : null,
            'extraphotos' => $this->extraphotos,
            'created_at' => $this->created_at_formatted,
            'updated_at' => $this->updated_at_formatted,
            'listing_type' => $this->category->name,
            'category' => new ListingCategoryResource($this->whenLoaded('category')),
            'user' => [
                'id' => $this->user->id,
                'name' => $this->user->name,
                'email' => $this->user->email,
                'bio' => $this->user->bio,
                'facebook' => $this->user->facebook,
                'twitter' => $this->user->twitter,
                'avatar' => $this->user->photoStaff ? $this->user->photoStaff->file : null,
                'user_role' => $this ->user->role->name,
            ],
        ];
    }
}
