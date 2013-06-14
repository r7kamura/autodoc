## POST /recipes
Creates a new recipe

```
POST /recipes
```

### parameters
* `name` string (required)
* `type` integer

### response
```ruby
Status: 201
location: http://www.example.com/recipes/1
response: 
{
  "created_at" => "2013-06-14T01:11:34Z",
  "id"         => 1,
  "name"       => "name",
  "updated_at" => "2013-06-14T01:11:34Z"
}
```

