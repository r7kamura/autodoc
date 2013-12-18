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
ETag: "817f9446a34cdb5179ee09b555b507f8"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: a1723cc5-c4f7-4779-8382-5dbf879687e5
X-Runtime: 0.017503
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "test",
  "type": 2,
  "created_at": "2013-12-18T06:33:23.129Z",
  "updated_at": "2013-12-18T06:33:23.129Z"
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
ETag: "9a32ff7207d60c4e3eca833ed83320f9"
Location: http://www.example.com/recipes/1
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 06f2dfe3-3085-419a-b2a8-db3abd1d3156
X-Runtime: 0.006099
X-UA-Compatible: chrome=1
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "name",
  "type": 1,
  "created_at": "2013-12-18T06:33:23.195Z",
  "updated_at": "2013-12-18T06:33:23.195Z"
}
```
