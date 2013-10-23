module Autodoc
  class Collector
    def collect(example, txn)
      documents[example.file_path] << Autodoc::Document.render(example, txn)
    end

    def documents
      @documents ||= Hash.new {|hash, key| hash[key] = [] }
    end
  end
end
