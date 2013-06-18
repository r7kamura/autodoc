## POST /recipes
Creates a new recipe

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
  "created_at" => "2013-06-18T06:33:40Z",
  "id"         => 1,
  "name"       => "name",
  "updated_at" => "2013-06-18T06:33:40Z"
}
```

