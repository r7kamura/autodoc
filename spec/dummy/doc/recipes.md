## GET /recipes/:id
Returns the recipe.

### Example
```
GET /recipes/:id HTTP/1.1
Content-Length: 0
Content-Type: application/json
Host: example.org
```

```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 111
Content-Type: application/json; charset=utf-8
ETag: "082bd55a40d73aebcc3f6227e98dcebb"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 1ced421d-4c76-44cf-bf5b-241358f73311
X-Runtime: 0.038226
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "test",
  "type": 2,
  "created_at": "2013-12-17T09:17:20.775Z",
  "updated_at": "2013-12-17T09:17:20.775Z"
}
```

## POST /recipes
Creates
a
new
recipe!


### Parameters
* `name` string (required, except: `["alice", "bob"]`)
* `type` integer (only: `1..3`)

### Example
```
POST /recipes HTTP/1.1
Accept: application/json
Content-Length: 24
Content-Type: application/json
Host: www.example.com

{
  "name": "name",
  "type": 1
}
```

```
HTTP/1.1 201
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 111
Content-Type: application/json; charset=utf-8
ETag: "1220735207c1ff5203a3c8975649d37a"
Location: http://www.example.com/recipes/1
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: b1fded86-bbc2-4442-9fa2-d9536bd55dd4
X-Runtime: 0.006243
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "name",
  "type": 1,
  "created_at": "2013-12-17T09:17:20.858Z",
  "updated_at": "2013-12-17T09:17:20.858Z"
}
```
