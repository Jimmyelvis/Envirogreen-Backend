<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SavedSearchResource extends JsonResource
{

    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'created_at' => $this->created_at_formatted,
            'updated_at' => $this->updated_at_formatted,
            'img' => $this->img,
            'user' => [
                'id' => $this->user->id,
                'name' => $this->user->name,
                'email' => $this->user->email,
                'avatar' => $this->user->photoStaff ? $this->user->photoStaff->file : null,
            ],
            'entries'=> [
                'baths' => $this->baths,
                'beds' => $this->beds,
                'price_min' => $this->price_min,
                'price_max' => $this->price_max,
                'city_name' => $this->City ? $this->City->name : null,
                'city_id' => $this->City ? $this->City->id : null,
                'state_name' => $this->State ? $this->State->name : null,
                'state_id' => $this->State ? $this->State->id : null,
                'category_name' => $this->Category ? $this->Category->name : null,
                'category_id' => $this->Category ? $this->Category->id : null,
            ]
        ];
    }
}
