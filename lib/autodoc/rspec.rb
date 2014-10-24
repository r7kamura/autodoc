require "rspec"

RSpec.configuration.after(:each, autodoc: true) do
  example = if RSpec.respond_to?(:current_example) #RSpec 3~
    RSpec.current_example
  else
    self.example
  end
  Autodoc.documents.append(self, example)
end

RSpec.configuration.after(:suite) do
  Autodoc.documents.write
end
