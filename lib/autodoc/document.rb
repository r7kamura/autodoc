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
      ERB.new(Autodoc.configuration.template, nil, "-").result(binding)
    end

    private

    def description
      "#{example.description.capitalize}."
    end

    def method
      request.method
    end

    def path
      example.full_description[%r<(GET|POST|PUT|DELETE) ([^ ]+)>, 2]
    end

    def response_body
      "\n" + JSON.parse(response.body).ai(plain: true, indent: -2, index: false)
    rescue JSON::ParserError
    end

    def request_body_section
      if has_request_body?
        "\n```\n#{request_body}\n```\n"
      end
    end

    def parameters_section
      if has_validators?
        "\n### parameters\n#{parameters}\n"
      end
    end

    def response_status
      response.status
    end

    def parameters
      validators.map {|validator| Parameter.new(validator) }.join("\n")
    end

    def request_body
      request.body.string
    end

    def has_request_body?
      request_body.present?
    end

    def has_validators?
      !!(defined?(WeakParameters) && validators)
    end

    def validators
      WeakParameters.stats[request.params[:controller]][request.params[:action]].try(:validators)
    end

    def response_headers
      Autodoc.configuration.headers.map do |header|
        "\n#{header}: #{response.headers[header]}" if response.headers[header]
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
        " (#{assets.join(', ')})" if assets.any?
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
