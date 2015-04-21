## GET /recipes/:id
Returns the recipe.

### Example

#### Request
```
GET /recipes/1 HTTP/1.1
Content-Length: 0
Content-Type: application/json
Host: example.org
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 111
Content-Type: application/json; charset=utf-8
ETag: W/"c95e174a05580bffa98c6cb95a2e9ae2"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 0bb04a6a-b8f3-4640-a487-6f97023efef0
X-Runtime: 0.013095
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "test",
  "type": 2,
  "created_at": "2015-04-21T14:55:09.299Z",
  "updated_at": "2015-04-21T14:55:09.299Z"
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

#### Request
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

#### Response
```
HTTP/1.1 201
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 111
Content-Type: application/json; charset=utf-8
ETag: W/"145ecc23e52083cbc00658e547234672"
Location: http://www.example.com/recipes/1
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 50bd40e2-d110-40e8-b6cb-7589262fd00a
X-Runtime: 0.003226
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "name",
  "type": 1,
  "created_at": "2015-04-21T14:55:09.346Z",
  "updated_at": "2015-04-21T14:55:09.346Z"
}
```
