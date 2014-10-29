require "rspec"

RSpec.configuration.after(:each, autodoc: true) do |example|
  Autodoc.documents.append(self, example)
end

RSpec.configuration.after(:suite) do
  Autodoc.documents.write
end
