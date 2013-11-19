# Autodoc
Auto-generate JSON API documents from your request-specs.

## Installation
```ruby
gem "autodoc", group: :test
```

## Usage
All request-specs tagged with `:autodoc` will be auto-documented.  
You must include a HTTP method and request path in the example description.

```
$ AUTODOC=1 rspec
```

```ruby
# spec/requests/recipes_spec.rb
describe "Recipes" do
  let(:params) do
    { name: "alice", type: 1 }
  end

  describe "POST /recipes", autodoc: true do
    it "creates a new recipe" do
      post "/recipes.json", params
      response.status.should == 201
    end
  end

  # in sinatra, add :type => :request
  describe "POST /recipes", :type => :request, autodoc: true do
    it "creates a new recipe" do
      post "/recipes.json", params
      response.status.should == 201
    end
  end
end


```

### Sinatra config
Add Autodoc.application_root to spec_helper

```ruby
Autodoc.application_root = File.expand_path( __dir__ + "/../")
```

## Result
The following document is generated in [doc/recipes.md](https://github.com/r7kamura/autodoc/blob/master/spec/dummy/doc/recipes.md).

<pre>
## POST /recipes
Creates a new recipe

```
POST /recipes
```

### parameters
* `name` string (required)
* `type` integer

### response
```
Status: 201
location: http://www.example.com/recipes/1
response: 
{
  "created_at" => "2013-06-07T08:28:35Z",
          "id" => 1,
        "name" => "alice",
        "type" => 1,
  "updated_at" => "2013-06-07T08:28:35Z"
}
```
</pre>

## Custom template
You can customize autodoc's template ([Example](https://github.com/r7kamura/autodoc/blob/master/lib/autodoc/configuration.rb#L18-L33)).  
Here are avilable variables:

* description
* example
* method
* parameters_section
* path
* request
* request_body_section
* response
* response_body
* response_headers
* response_status

### Example
<pre>
Autodoc.configuration.template = &lt;&lt;-EOF
  ## &lt;%= method %&gt; &lt;%= path %&gt;
  &lt;%= description %&gt;
  &lt;%= parameters_section %&gt;
  ### request
  ```
  &lt;%= method %&gt; &lt;%= path %&gt;
  ```
  &lt;%= request_body_section %&gt;
  ### response
  ```ruby
  Status: &lt;%= response_status %&gt;&lt;%= response_headers %&gt;
  response: &lt;%= response_body %&gt;
  ```

EOF
</pre>
