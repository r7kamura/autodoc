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
      table = Hash.new {|table, key| table[key] = [] }
      Autodoc.contexts.each do |context|
        transaction = Autodoc::Transaction.build(context)
        table[context.example.file_path] << Autodoc::Document.render(context.example, transaction)
      end

      table.each do |path, documents|
        pathname = Rails.root.join("doc")
        pathname += ENV["AUTODOC"] if ENV["AUTODOC"] != "1"
        pathname += path.gsub("./spec/requests/", "").gsub("_spec.rb", ".md")
        pathname.parent.mkpath
        pathname.open("w") {|file| file << documents.join("\n").rstrip + "\n" }
      end
    end
  end
end
