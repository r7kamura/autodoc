require "rspec"

RSpec.configuration.after(:each, autodoc: true) do
  Autodoc.documents.append(self)
end

RSpec.configuration.after(:suite) do
  Autodoc.documents.write
end
