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
  "created_at": "2013-11-30T13:44:22.198Z",
  "updated_at": "2013-11-30T13:44:22.198Z"
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
Location: http://example.org/recipes/1
response: 
{
  "id": 1,
  "name": "name",
  "type": 1,
  "created_at": "2013-11-30T13:44:22.207Z",
  "updated_at": "2013-11-30T13:44:22.207Z"
}
```
