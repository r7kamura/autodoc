# You can configure documented headers.
#
# Examples
#
#   # response.headers["X-Content-Type-Options"] will be documented.
#   Autodoc.configuration.headers << "X-Content-Type-Options"
#
module Autodoc
  class Configuration
    attr_writer :headers, :base_path, :template

    def headers
      @headers ||= %w[Location]
    end

    def base_path
      @base_path ||= begin
        path = Rails.root.join("doc")
        path += ENV["AUTODOC"] if ENV["AUTODOC"] != "1"
        path
      end
    end

    def template
      @template ||= <<-EOF.strip_heredoc
        <%# coding: UTF-8 -%>
        ## <%= method %> <%= path %>
        <%= description %>
        <%= parameters_section %>
        ### request
        ```
        <%= method %> <%= path %>
        ```
        <%= request_body_section %>
        ### response
        ```ruby
        Status: <%= response_status %><%= response_headers %>
        response: <%= response_body %>
        ```

      EOF
    end
  end
end
