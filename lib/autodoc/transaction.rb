module Autodoc
  class Transaction
    def self.build(context)
      if defined?(Rack::Test::Methods) && context.class.ancestors.include?(Rack::Test::Methods)
        if defined?(ActionDispatch::Request)
          self.new(ActionDispatch::Request.new(context.last_request.env), context.last_response)
        else
          self.new(context.last_request, context.last_response)
        end
      else
        self.new(context.request, context.response)
      end
    end

    attr_accessor :request, :response

    def initialize(*args)
      @request, @response = *args
    end

    def method
      request.request_method
    end

    def request_body
      request.body.string
    end

    def response_status
      response.status
    end

    def response_header(header)
      response.headers[header]
    end

    def response_body_raw
      response.body
    end

    def controller
      request.params[:controller]
    end

    def action
      request.params[:action]
    end
  end
end
