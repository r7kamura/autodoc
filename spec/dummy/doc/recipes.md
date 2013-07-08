## POST /recipes
Recipes POST /recipes with valid condition creates a new recipe.

### parameters
* `name` string (required, except: `["alice", "bob"]`)
* `type` integer (only: `"1".."3"`)

### request
```
POST /recipes
```

```
name=name&type=1
```

### response
```ruby
Status: 201
location: http://www.example.com/recipes/1
response: 
{
  "created_at" => "2013-07-08T06:11:46Z",
  "id"         => 1,
  "name"       => "name",
  "updated_at" => "2013-07-08T06:11:46Z"
}
```

