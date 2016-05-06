require 'shellwords'
module Autodoc
  class Configuration
    class << self
      def property(name, &default)
        define_method(name) do
          if instance_variable_defined?("@#{name}")
            instance_variable_get("@#{name}")
          else
            instance_variable_set("@#{name}", instance_exec(&default))
          end
        end

        attr_writer name
      end
    end

    property :document_path_from_example do
    end

    property :path do
      "doc"
    end

    property :suppressed_request_header do
      []
    end

    property :suppressed_response_header do
      []
    end

    property :template do
      File.read(File.expand_path("../templates/document.md.erb", __FILE__))
    end

    property :toc_template do
      File.read(File.expand_path("../templates/toc.md.erb", __FILE__))
    end

    property :toc_html do
      false
    end

    property :toc_html_template do
      File.read(File.expand_path("../templates/toc.html.erb", __FILE__))
    end

    property :toc do
      false
    end

    def pathname
      Pathname.new(Shellwords.shellescape(path))
    end
  end
end
