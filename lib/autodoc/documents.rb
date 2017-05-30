require "pathname"

module Autodoc
  class Documents
    def initialize
      @table = Hash.new {|table, key| table[key] = [] }
    end

    def append(context, example)
      document = Autodoc::Document.new(context.clone, example.clone)
      @table[document.pathname] << document
    end

    def write
      write_toc if Autodoc.configuration.toc
      write_toc_html if Autodoc.configuration.toc_html

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

    def write_toc_html
      toc_html_path.parent.mkpath
      toc_html_path.open("w") {|file| file << render_toc_html }
    end

    def render_toc_html
      ERB.new(Autodoc.configuration.toc_html_template, nil, "-").result(binding)
    end

    def toc_path
      Autodoc.configuration.pathname + "toc.md"
    end

    def toc_html_path
      Autodoc.configuration.pathname + "toc.html"
    end
  end
end
