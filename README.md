# Autodoc
Auto-generate API documents from your request-specs.

## Installation
```ruby
gem "autodoc", group: :test
```

## Usage
```
$ AUTODOC=1 bundle exec rspec
```

### Rule
* Example description must include a method in upper case.
* Example description must include a path.
* Example invokes one request at least.

```ruby
describe "Recipes" do
  let(:params) do
    { name: "alice", type: 1 }
  end

  describe "POST /recipes" do
    it "creates a new recipe" do
      post "/recipes/", params
    end
  end
end
```
