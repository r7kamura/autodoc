## GET /recipes/:id
Returns the recipe.

### request
```
GET /recipes/:id
```

### response
```ruby
Status: 200
response: 
{
  "id": 1,
  "name": "test",
  "type": 2,
  "created_at": "2013-12-10T02:07:44.282Z",
  "updated_at": "2013-12-10T02:07:44.282Z"
}
```

## POST /recipes
Creates a new recipe.

### parameters
* `name` string (required, except: `["alice", "bob"]`)
* `type` integer (only: `1..3`)

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
Location: http://www.example.com/recipes/1
response: 
{
  "id": 1,
  "name": "name",
  "type": 1,
  "created_at": "2013-12-10T02:07:44.355Z",
  "updated_at": "2013-12-10T02:07:44.355Z"
}
```
