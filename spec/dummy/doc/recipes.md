## POST /recipes
Creates a new recipe

```
POST /recipes
```

### parameters
* `name` string (required)
* `type` integer

### response
```
Status: 201
location: http://www.example.com/recipes/1
response: 
{
  "created_at" => "2013-06-07T08:58:12Z",
          "id" => 1,
        "name" => "name",
  "updated_at" => "2013-06-07T08:58:12Z"
}
```

