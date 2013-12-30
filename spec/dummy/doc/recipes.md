## GET /recipes/:id
Returns the recipe.

### Example
```
GET /recipes/1 HTTP/1.1
Content-Length: 0
Content-Type: application/json
Host: example.org
```

```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 111
Content-Type: application/json; charset=utf-8
ETag: "d2bb4f3624c215dcc71b683ec7d58ebd"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 5f84d51d-9709-4a8f-a02c-77732902252b
X-Runtime: 0.013851
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "test",
  "type": 2,
  "created_at": "2013-12-29T14:22:59.625Z",
  "updated_at": "2013-12-29T14:22:59.625Z"
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
ETag: "0d698f869368039f2145c92927b36720"
Location: http://www.example.com/recipes/1
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 84349101-dc40-4416-83a0-a767242881f9
X-Runtime: 0.003861
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "name",
  "type": 1,
  "created_at": "2013-12-29T14:22:59.676Z",
  "updated_at": "2013-12-29T14:22:59.676Z"
}
```
