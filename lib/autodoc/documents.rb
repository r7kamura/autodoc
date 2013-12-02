require "pathname"

module Autodoc
  class Documents
    def initialize
      @table = Hash.new {|table, key| table[key] = [] }
    end

    def append(context)
      document = Autodoc::Document.new(context.clone)
      @table[document.pathname] << document
    end

    def write
      write_toc if Autodoc.configuration.toc
      write_documents
    end

    private

    def write_documents
      @table.each do |pathname, documents|
        pathname.parent.mkpath
        pathname.open("w") {|file| file << documents.map(&:render).join("\n").rstrip + "\n" }
      end
    end

    def write_toc
      toc_path.parent.mkpath
      toc_path.open("w") {|file| file << render_toc }
    end

    def render_toc
      ERB.new(Autodoc.configuration.toc_template, nil, "-").result(binding)
    end

    def toc_path
      Pathname.new(Autodoc.configuration.path) + "toc.md"
    end
  end
end
