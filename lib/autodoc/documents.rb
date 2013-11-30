module Autodoc
  class Documents
    def initialize
      @table = Hash.new {|table, key| table[key] = [] }
    end

    def append(context)
      path = context.example.file_path.gsub(%r<\./spec/requests/(.+)_spec\.rb>, '\1.md')
      key = Autodoc.configuration.base_path + path
      @table[key] << Autodoc::Document.render(context)
    end

    def write
      @table.each do |pathname, documents|
        pathname.parent.mkpath
        pathname.open("w") {|file| file << documents.join("\n").rstrip + "\n" }
      end
    end
  end
end
