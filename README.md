# Autodoc
Auto-generate JSON API documents from your request-specs.

## Installation
```ruby
gem "autodoc", group: :test
```

## Usage
Run rspec with AUTODOC=1 to generate documents for the specs tagged with `:autodoc`.  
example: [doc/recipes.md](https://github.com/r7kamura/autodoc/blob/master/spec/dummy/doc/recipes.md), [doc/toc.md](https://github.com/r7kamura/autodoc/blob/master/spec/dummy/doc/toc.md)

```sh
# shell-command
AUTODOC=1 rspec
```

```ruby
# spec/requests/recipes_spec.rb
describe "Recipes" do
  describe "POST /recipes", autodoc: true do
    it "creates a new recipe" do
      post "/recipes.json", name: "alice", type: 1
      response.status.should == 201
    end
  end
end
```

### Configuration
You can configure `Autodoc.configuration` to change its behavior:

* path - [String] location to put files (default: ./doc)
* headers - [Array] keys of documented response header (default: ["Location"])
* template - [String] ERB template for each document (default: [document.md.erb](https://github.com/r7kamura/autodoc/blob/master/lib/autodoc/templates/document.md.erb))
* toc_template - [String] ERB template for ToC (default: [toc.md.erb](https://github.com/r7kamura/autodoc/blob/master/lib/autodoc/templates/toc.md.erb))
* toc - [Boolean] whether to generate toc.md (default: false)

```ruby
# example
Autodoc.configuration.path = "doc/api"
Autodoc.configuration.toc = true
```
