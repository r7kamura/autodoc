require "awesome_print"
require "erb"

module Autodoc
  class Document
    def self.render(*args)
      new(*args).render
    end

    attr_reader :example, :transaction

    delegate :method, :request_body, :response_status, :response_header, :response_body_raw, :controller, :action, :request_fullpath,
      to: :transaction

    def initialize(example, txn)
      @example, @transaction = example, txn
    end

    def render
      ERB.new(Autodoc.configuration.template, nil, "-").result(binding)
    end

    private

    def description
      "#{example.description.capitalize}."
    end

    def path
      request_fullpath
    end

    def response_body
      JSON.pretty_generate(JSON.parse(response_body_raw))
    rescue JSON::ParserError
    end

    def request_body_section
      JSON.pretty_generate(JSON.parse(request_body))
    rescue JSON::ParserError
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

    def etag?
      !!response_header("ETag")
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
