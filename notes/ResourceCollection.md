Yes, you can combine them. The key idea is to use your `ListingResource` for individual items and then wrap that in a `ListingCollection` for the paginated output. Essentially:

- Your `ListingCollection` will handle the pagination fields (flattened as you want).
- Inside `ListingCollection`'s `toArray()`, instead of just `$this->collection`, you apply `ListingResource::collection($this->collection)` to transform each listing with your custom resource.

**Example:**

```php
// app/Http/Resources/ListingCollection.php
namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ListingCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            // Use your ListingResource for each item in the collection
            'data' => ListingResource::collection($this->collection),

            // Now add your flattened pagination fields
            'current_page' => $this->resource->currentPage(),
            'last_page' => $this->resource->lastPage(),
            'per_page' => $this->resource->perPage(),
            'total' => $this->resource->total(),
            'from' => $this->resource->firstItem(),
            'to' => $this->resource->lastItem(),
            'next_page_url' => $this->resource->nextPageUrl(),
            'prev_page_url' => $this->resource->previousPageUrl(),
            'path' => $this->resource->path(),
            // ... any other pagination fields you want
        ];
    }
}
```

**How to Use:**
In your controller or wherever you’re returning the data, you’d do something like:

```php
public function multiresults(Request $request)
{
    $listings = $query->paginate($perPage);
    return new ListingCollection($listings);
}
```

What this does is:

- `ListingCollection` handles the pagination and the top-level structure.
- For each individual item, `ListingResource` transforms the data fields as defined in your resource.

This way, you get both the flattened pagination fields **and** the custom fields from `ListingResource` in a single, coherent JSON response.
