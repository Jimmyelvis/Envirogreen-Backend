<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SearchResultsResource extends JsonResource
{
    public function toArray($request)
    {
        if ($this->resource instanceof \App\Models\City) {
            return [
                'type' => 'city',
                'id' => $this->id,
                'name' => $this->name,
                'state_id' => $this->state_id,
                'state_name' => $this->state ? $this->state->name : null,
                'state_abbrev' => $this->state ? $this->state->abbrev : null,
                'listings_count' => $this->listings_for_city_count,
            ];
        } elseif ($this->resource instanceof \App\Models\State) {
            return [
                'type' => 'state',
                'id' => $this->id,
                'name' => $this->name,
                'abbrev' => $this->abbrev,
                'listings_count' => $this->listings_for_state_count,
            ];
        } else {
            return [];
        }
    }
}
