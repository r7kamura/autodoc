## POST /recipes
Creates a new recipe.

### parameters
* `name` string (required, except: `["alice", "bob"]`)
* `type` integer (only: `1..3`)

### request
```
POST /recipes
```

#### request.params

```
{"name"=>"name", "type"=>"1", "image"=>#<ActionDispatch::Http::UploadedFile:0x007f874d96ba00 @tempfile=#<Tempfile:/var/folders/b2/t0bfhlx94fjcfbwwrz4gp8x80000gn/T/RackMultipart20131119-39611-199g120>, @original_filename="sample_image1.jpg", @content_type="image/jpg", @headers="Content-Disposition: form-data; name=\"image\"; filename=\"sample_image1.jpg\"\r\nContent-Type: image/jpg\r\nContent-Length: 12608\r\n">, "action"=>"create", "controller"=>"recipes"}
```


### response
```ruby
Status: 201
response: 
{
  "id": 1,
  "name": "name",
  "type": 1,
  "created_at": "2013-11-18T17:46:38.870Z",
  "updated_at": "2013-11-18T17:46:38.870Z"
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

#### request.params

```
{"name"=>"name", "type"=>"1", "image"=>#<ActionDispatch::Http::UploadedFile:0x007f874a1b1858 @tempfile=#<Tempfile:/var/folders/b2/t0bfhlx94fjcfbwwrz4gp8x80000gn/T/RackMultipart20131119-39611-1tgd5t2>, @original_filename="sample_image1.jpg", @content_type="image/jpg", @headers="Content-Disposition: form-data; name=\"image\"; filename=\"sample_image1.jpg\"\r\nContent-Type: image/jpg\r\nContent-Length: 12608\r\n">, "action"=>"create", "controller"=>"recipes"}
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
  "created_at": "2013-11-18T17:46:38.878Z",
  "updated_at": "2013-11-18T17:46:38.878Z"
}
```
