<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class BlogCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @return array<int|string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'data' => BlogPostResource::collection($this->collection),

            'current_page' => $this->resource->currentPage(),
            'last_page' => $this->resource->lastPage(),
            'per_page' => $this->resource->perPage(),
            'total' => $this->resource->total(),
            'from' => $this->resource->firstItem(),
            'to' => $this->resource->lastItem(),
            'next_page_url' => $this->resource->nextPageUrl(),
            'prev_page_url' => $this->resource->previousPageUrl(),
        ];
    }
}
