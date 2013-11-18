# You can configure documented headers.
#
# Examples
#
#   # response.headers["X-Content-Type-Options"] will be documented.
#   Autodoc.configuration.headers << "X-Content-Type-Options"
#
module Autodoc
  class Configuration
    attr_accessor :headers, :template

    def initialize
      reset
    end

    def reset
      @headers = %w[location]
      @template = <<-EOF.strip_heredoc
        <%# coding: UTF-8 -%>
        ## <%= method %> <%= path %>
        <%= description %>
        <%= parameters_section %>
        ### request
        ```
        <%= method %> <%= path %>
        ```
        <% if ENV["INCLUDE_IMAGE"] == "1" %>
        #### request.params
        <%= request_params_section %>
        <% else %>
        <%= request_body_section %>
        <% end %>
        ### response
        ```ruby
        Status: <%= response_status %><%= response_headers %>
        response: <%= response_body %>
        ```

      EOF
    end
  end
end
