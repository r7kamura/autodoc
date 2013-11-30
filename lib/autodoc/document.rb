require "erb"

module Autodoc
  class Document
    def self.render(*args)
      new(*args).render
    end

    attr_reader :example

    def initialize(context)
      @context = context
    end

    def render
      ERB.new(Autodoc.configuration.template, nil, "-").result(binding)
    end

    private

    def request
      @request ||= begin
        if using_rack_test?
          ActionDispatch::Request.new(@context.last_request.env)
        else
          @context.request
        end
      end
    end

    def response
      @response ||= begin
        if using_rack_test?
          @context.last_response
        else
          @context.response
        end
      end
    end

    def method
      request.method
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

    def using_rack_test?
      !!defined?(Rack::Test::Methods) && @context.class.ancestors.include?(Rack::Test::Methods)
    end

    def transaction
      @transaction ||= Autodoc::Transaction.build(@context)
    end

    def description
      "#{@context.example.description.capitalize}."
    end

    def path
      @context.example.full_description[%r<(GET|POST|PUT|DELETE) ([^ ]+)>, 2]
    end

    def response_body
      "\n" + JSON.pretty_generate(JSON.parse(response_body_raw))
    rescue JSON::ParserError
    end

    def request_body_section
      if has_request_body?
        "\n```\n#{request_body}\n```\n"
      end
    end

    def parameters_section
      if has_validators? && parameters.present?
        "\n### parameters\n#{parameters}\n"
      end
    end

    def parameters
      validators.map {|validator| Parameter.new(validator) }.join("\n")
    end

    def has_request_body?
      request_body.present?
    end

    def has_validators?
      !!(defined?(WeakParameters) && validators)
    end

    def validators
      WeakParameters.stats[controller][action].try(:validators)
    end

    def response_headers
      Autodoc.configuration.headers.map do |header|
        "\n#{header}: #{response_header(header)}" if response_header(header)
      end.compact.join
    end

    class Parameter
      attr_reader :validator

      def initialize(validator)
        @validator = validator
      end

      def to_s
        "#{body}#{payload}"
      end

      private

      def body
        "* `#{validator.key}` #{validator.type}"
      end

      def payload
        string = ""
        string << " (#{assets.join(', ')})" if assets.any?
        string << " - #{validator.options[:description]}" if validator.options[:description]
        string
      end

      def assets
        @assets ||= [required, only, except].compact
      end

      def required
        "required" if validator.required?
      end

      def only
        "only: `#{validator.options[:only].inspect}`" if validator.options[:only]
      end

      def except
        "except: `#{validator.options[:except].inspect}`" if validator.options[:except]
      end
    end
  end
end
