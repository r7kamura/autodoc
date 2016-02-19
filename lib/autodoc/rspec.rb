require "rspec"

RSpec.configuration.after(:each, autodoc: true) do |example|
  Autodoc.documents.append(self, example) unless example.pending?
end

RSpec.configuration.after(:suite) do
  Autodoc.documents.write
end
