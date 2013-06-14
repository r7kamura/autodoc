require "awesome_print"
require "erb"

module Autodoc
  class Document
    def self.render(*args)
      new(*args).render
    end

    attr_reader :example, :request, :response

    def initialize(example, request, response)
      @example, @request, @response = example, request, response
    end

    def render
      ERB.new(template).result(binding)
    end

    private

    def template
      File.read(__FILE__).split("__END__\n", 2).last
    end

    def path
      example.full_description[%r<(GET|POST|PUT|DELETE) ([^ ]+)>, 2]
    end

    # request.body can be "" (e.g. in PUT and DELETE request)
    def request_body
      "\n" + JSON.parse(response.body).ai(plain: true, indent: -2, index: false)
    rescue JSON::ParserError
    end

    def parameters_section
      if has_validators?
        "\n### parameters\n#{parameters}\n"
      end
    end

    def parameters
      validators.map do |validator|
        "* `#{validator.key}` #{validator.type}#{' (required)' if validator.required?}"
      end.join("\n")
    end

    def has_validators?
      !!(defined?(WeakParameters) && validators)
    end

    def validators
      WeakParameters.stats[request.params[:controller]][request.params[:action]].try(:validators)
    end

    def headers
      Autodoc.configuration.headers.map do |header|
        "\n#{header}: #{response.headers[header]}" if response.headers[header]
      end.compact.join
    end
  end
end

__END__
## <%= request.method %> <%= path %>
<%= example.description.camelize %>

```
<%= request.method %> <%= request.path %>
```
<%= parameters_section %>
### response
```ruby
Status: <%= response.status %><%= headers %>
response: <%= request_body %>
```

