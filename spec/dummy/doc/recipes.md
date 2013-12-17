## GET /recipes/:id
Returns the recipe.

## Example
```
GET /recipes/:id HTTP/1.1
Accept: application/json
Content-Length: 0
Host: example.org
```

```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 111
Content-Type: application/json; charset=utf-8
ETag: "349ed81d084907a8583a84c1643c4f26"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 52ca31ee-4b32-4bdd-ae9e-fed8badaa9b7
X-Runtime: 0.023516
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "test",
  "type": 2,
  "created_at": "2013-12-17T08:32:27.415Z",
  "updated_at": "2013-12-17T08:32:27.415Z"
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

## Example
```
POST /recipes HTTP/1.1
Accept: application/json
Content-Length: 16
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

name=name&type=1
```

```
HTTP/1.1 201
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 111
Content-Type: application/json; charset=utf-8
ETag: "fca9b8e000ef821607eda6104ceec86b"
Location: http://www.example.com/recipes/1
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 27e3eef6-2d84-479c-999e-a1142f7ecc74
X-Runtime: 0.005600
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "name",
  "type": 1,
  "created_at": "2013-12-17T08:32:27.475Z",
  "updated_at": "2013-12-17T08:32:27.475Z"
}
```
