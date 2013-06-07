module Autodoc
  class Collector
    def collect(example, request, response)
      documents[example.file_path] << Autodoc::Document.render(example, request, response)
    end

    def documents
      @documents ||= Hash.new {|hash, key| hash[key] = [] }
    end
  end
end
