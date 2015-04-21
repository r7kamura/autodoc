## GET /entries
Returns entries.

### Example

#### Request
```
GET /entries HTTP/1.1
Accept: application/json
Content-Length: 0
Host: example.org
```

#### Response
```
HTTP/1.1 200
Content-Length: 45
Content-Type: application/json

[
  {
    "title": "Test Title",
    "body": "Lorem Ipsum"
  }
]
```
