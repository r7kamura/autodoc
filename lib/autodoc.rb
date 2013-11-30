require "autodoc/configuration"
require "autodoc/document"
require "autodoc/documents"
require "autodoc/version"
require "autodoc/rspec" if ENV["AUTODOC"]

module Autodoc
  class << self
    def documents
      @documents ||= Documents.new
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
