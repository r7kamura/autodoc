require "autodoc/collector"
require "autodoc/configuration"
require "autodoc/document"
require "autodoc/version"

module Autodoc
  class << self
    attr_accessor :application_root

    def collector
      @collector ||= Autodoc::Collector.new
    end

    def configuration
      @configuration ||= Autodoc::Configuration.new
    end
  end
end

if ENV["AUTODOC"] && defined?(RSpec)
  RSpec.configure do |config|
    config.after(:each, type: :request) do
      if example.metadata[:autodoc]
        Autodoc.collector.collect(example, last_request, last_response)
      end
    end

    config.after(:suite) do
      Autodoc.collector.documents.each do |filepath, documents|
        filepath = filepath.gsub("./spec/requests/", "").gsub("_spec.rb", ".md")
        
        pathname = Pathname.new(Autodoc.application_root).join("doc")
        pathname += ENV["AUTODOC"] if ENV["AUTODOC"] != "1"
        pathname += filepath
        pathname.parent.mkpath
        pathname.open("w") {|file| file << documents.join("\n").rstrip + "\n" }
      end
    end
  end
end
