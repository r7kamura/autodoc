require "rspec"

RSpec.configuration.after(:each, autodoc: true) do
  Autodoc.contexts << self.clone
end

RSpec.configuration.after(:suite) do
  table = Autodoc.contexts.group_by {|context| context.example.file_path }
  table.each do |path, contexts|
    pathname = Autodoc.configuration.base_path + path.gsub("./spec/requests/", "").gsub("_spec.rb", ".md")
    pathname.parent.mkpath
    pathname.open("w") do |file|
      file << contexts.map {|context| Autodoc::Document.render(context) }.join("\n").rstrip + "\n"
    end
  end
end
