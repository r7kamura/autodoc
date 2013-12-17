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
ETag: "644268fba32fef5d0c220ee841e6f0d3"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 440000dc-0277-4b2e-abdc-5863752a6fc1
X-Runtime: 0.042121
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "test",
  "type": 2,
  "created_at": "2013-12-17T09:07:04.233Z",
  "updated_at": "2013-12-17T09:07:04.233Z"
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
ETag: "7d124786b38ff20989617a703ab0c0d0"
Location: http://www.example.com/recipes/1
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 5ed2b49f-f5c1-4db4-8b36-ddf40fd45cde
X-Runtime: 0.007229
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "name",
  "type": 1,
  "created_at": "2013-12-17T09:07:04.323Z",
  "updated_at": "2013-12-17T09:07:04.323Z"
}
```
