require "rspec"
require "autodoc/configuration"
require "autodoc/document"
require "autodoc/transaction"
require "autodoc/version"

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

if ENV["AUTODOC"]
  RSpec.configure do |config|
    config.after(:each, autodoc: true) do
      Autodoc.contexts << self.clone
    end

    config.after(:suite) do
      table = Autodoc.contexts.group_by {|context| context.example.file_path }
      table.each do |path, contexts|
        pathname = Rails.root.join("doc")
        pathname += ENV["AUTODOC"] if ENV["AUTODOC"] != "1"
        pathname += path.gsub("./spec/requests/", "").gsub("_spec.rb", ".md")
        pathname.parent.mkpath
        pathname.open("w") do |file|
          file << contexts.map {|context| Autodoc::Document.render(context) }.join("\n").rstrip + "\n"
        end
      end
    end
  end
end
