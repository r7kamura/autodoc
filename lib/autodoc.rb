require "autodoc/configuration"
require "autodoc/document"
require "autodoc/version"
require "autodoc/rspec" if ENV["AUTODOC"]

module Autodoc
  class << self
    def contexts
      @contexts ||= []
    end

    def configuration
      @configuration ||= Autodoc::Configuration.new
    end
  end
end
