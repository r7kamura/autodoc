module Autodoc
  class Transaction
    def self.build(context)
      if defined?(ActionDispatch::Request) && defined?(Rack::Test::Methods) && context.class.ancestors.include?(Rack::Test::Methods)
        self.new(ActionDispatch::Request.new(context.last_request.env), context.last_response)
      elsif defined?(Sinatra)
        self.new(context.last_request, context.last_response)
      else
        self.new(context.request, context.response)
      end
    end

    attr_accessor :request, :response

    def initialize(*args)
      @request, @response = *args
    end

    def method
      if defined?(Sinatra)
        request.env["REQUEST_METHOD"]
      else
        request.method
      end
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
