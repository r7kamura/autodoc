# Autodoc
Auto-generate JSON API documents from your request-specs.

## Installation
```ruby
gem "autodoc", group: :test
```

## Usage
All request-specs tagged with `:autodoc` will be auto-documented.

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
end
```

Run rspec with AUTODOC=1 to generate documents. ([example](https://github.com/r7kamura/autodoc/blob/master/spec/dummy/doc/recipes.md))

```sh
# shell-command
AUTODOC=1 rspec
```

### Configuration
You can configure `Autodoc.configuration` to change its behavior:

* path - [String] location to put files (default: ./doc)
* headers - [Array] keys of documented response header (default: ["Location"])
* template - [String] ERB template for each document (default: [document.md.erb](https://github.com/r7kamura/autodoc/blob/master/lib/autodoc/templates/document.md.erb))
* toc_template - [String] ERB template for ToC (default: [toc.md.erb](https://github.com/r7kamura/autodoc/blob/master/lib/autodoc/templates/toc.md.erb))
* toc - [Boolean] whether to generate toc.md (default: false)
