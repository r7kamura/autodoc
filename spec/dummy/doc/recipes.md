## POST /recipes
Recipes POST /recipes with valid condition creates a new recipe.

```
POST /recipes
```

### parameters
* `name` string (required, except: `["alice", "bob"]`)
* `type` integer (only: `"1".."3"`)

### response
```ruby
Status: 201
location: http://www.example.com/recipes/1
response: 
{
  "created_at" => "2013-07-08T05:58:47Z",
  "id"         => 1,
  "name"       => "name",
  "updated_at" => "2013-07-08T05:58:47Z"
}
```

