# Autodoc

[![CircleCI](https://circleci.com/gh/r7kamura/autodoc.svg?style=svg)](https://circleci.com/gh/r7kamura/autodoc)
[![Gem Version](https://badge.fury.io/rb/autodoc.svg)](https://rubygems.org/gems/autodoc)

Generate documentation from your rack application & request-spec.

## Installation
```ruby
gem "autodoc", group: :test
```

If you want to generate toc_html, you should install [redcarpet gem](https://github.com/vmg/redcarpet) (optional).

```ruby
gem "redcarpet", group: :test
```

## Usage
Run rspec with AUTODOC=1 to generate documents for your request-specs tagged with `:autodoc`.  
example: Autodoc generates [doc/recipes.md](https://github.com/r7kamura/autodoc/blob/master/spec/dummy/doc/recipes.md) and [doc/toc.md](https://github.com/r7kamura/autodoc/blob/master/spec/dummy/doc/toc.md) from [spec/requests/recipes_spec.rb](https://github.com/r7kamura/autodoc/blob/master/spec/requests/recipes_spec.rb).

```sh
# shell-command
AUTODOC=1 rspec
```

### Examples
#### For any Rack application with rack-test
```ruby
# spec/requests/entries_spec.rb
describe "Entries" do
  include Rack::Test::Methods

  let(:app) do
    MyRackApplication
  end

  describe "GET /entries", autodoc: true do
    it "returns entries" do
      get "/entries"
      last_response.status.should == 200
    end
  end
end
```

#### For Rails application with rspec-rails
```ruby
# spec/requests/recipes_spec.rb
describe "Recipes" do
  describe "POST /recipes", autodoc: true do
    it "creates a new recipe" do
      post "/recipes", name: "alice", type: 1
      response.status.should == 201
    end
  end
end
```

### Custom description
You can write more detailed descriptions with `let(:description)`.

```ruby
describe "Recipes" do
  describe "PUT /recipes/:id", autodoc: true do
    let(:description) do
      "Updates a recipe. `name` parameter is required."
    end

    it "updates a recipe" do
      put "/recipes/#{recipe.id}", name: "Bob"
      response.status.should == 204
    end
  end
end
```

### Configuration
You can configure `Autodoc.configuration` to change its behavior:

* path - [String] location to put files (default: ./doc)
* suppressed_request_header - [Strings] filtered request header keys
* suppressed_response_header - [Strings] filtered response header keys
* template - [String] ERB template for each document (default: [document.md.erb](https://github.com/r7kamura/autodoc/blob/master/lib/autodoc/templates/document.md.erb))
* toc_template - [String] ERB template for ToC (default: [toc.md.erb](https://github.com/r7kamura/autodoc/blob/master/lib/autodoc/templates/toc.md.erb))
* toc - [Boolean] whether to generate toc.md (default: false)
* toc_html_template - [String] ERB template for html ToC (default: [toc.html.erb](https://github.com/r7kamura/autodoc/blob/master/lib/autodoc/templates/toc.html.erb))
* toc_html - [Boolean] whether to generate toc.html - a single page documentation with a toc (default: false)
* document_path_from_example - [Proc] specify a Proc to change the naming rule of document file paths

```ruby
Autodoc.configuration.path = "doc/api"
Autodoc.configuration.toc = true
Autodoc.configuration.toc_html = true
Autodoc.configuration.template = File.read(File.expand_path("../autodoc/templates/document.md.erb", __FILE__))
Autodoc.configuration.document_path_from_example = -> (example) do
  example.file_path.gsub(%r<\./spec/requests/api/(.+)_spec\.rb>, '\1.md')
end
```

## WeakParameters integration
If your app uses [WeakParameters](https://github.com/r7kamura/weak_parameters) to define parameters schema
in your controller, autodoc scans them and provides `### Parameters` section to generated docs.

```rb
class RecipesController < ApplicationController
  validates :create do
    string :name, required: true, except: ["charlie", "dave"]
    integer :type, only: 1..3
  end
```
