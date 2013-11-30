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

    property :base_path do
      path = Rails.root.join("doc")
      path += ENV["AUTODOC"] if ENV["AUTODOC"] != "1"
      path
    end

    property :headers do
      %w[Location]
    end

    property :template do
      File.read(File.expand_path("../templates/section.md.erb", __FILE__))
    end

    property :toc_template do
      File.read(File.expand_path("../templates/toc.md.erb", __FILE__))
    end

    property :toc do
      false
    end
  end
end
