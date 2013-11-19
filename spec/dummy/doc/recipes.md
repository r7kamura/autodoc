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
response: 
{
  "id": 1,
  "name": "name",
  "type": 1,
  "created_at": "2013-10-29T01:19:45.089Z",
  "updated_at": "2013-10-29T01:19:45.089Z"
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
location: http://example.org/recipes/1
response: 
{
  "id": 1,
  "name": "name",
  "type": 1,
  "created_at": "2013-10-29T01:19:45.098Z",
  "updated_at": "2013-10-29T01:19:45.098Z"
}
```
