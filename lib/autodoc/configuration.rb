module Autodoc
  class Configuration
    attr_writer :headers, :base_path, :template

    def headers
      @headers ||= %w[Location]
    end

    def base_path
      @base_path ||= begin
        path = Rails.root.join("doc")
        path += ENV["AUTODOC"] if ENV["AUTODOC"] != "1"
        path
      end
    end

    def template
      @template ||= File.read(File.expand_path("../template.md.erb", __FILE__))
    end
  end
end
