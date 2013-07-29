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
      @template = nil
    end
  end
end
