require "autodoc/collector"
require "autodoc/document"
require "autodoc/version"

module Autodoc
  def self.collector
    @collector ||= Autodoc::Collector.new
  end
end

if ENV["AUTODOC"] && defined?(RSpec)
  RSpec.configure do |config|
    config.after(:each, type: :request) do
      if example.metadata[:autodoc]
        Autodoc.collector.collect(example, request, response)
      end
    end

    config.after(:suite) do
      Autodoc.collector.documents.each do |filepath, documents|
        filepath = filepath.gsub("./spec/requests/", "").gsub("_spec.rb", ".md")
        pathname = Rails.root + "doc/#{filepath}"
        pathname.parent.mkpath
        pathname.open("w") {|file| file << documents.join("\n") }
      end
    end
  end
end
