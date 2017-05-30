require "spec_helper"

describe Autodoc::Documents do
  describe "#render_toc" do
    before do
      if ::RSpec::Core::Version::STRING.match(/\A(?:3|2\.99)\./)
        documents.append(context, example)
      else
        documents.append(context, double)
      end
    end

    let(:documents) do
      Autodoc::Documents.new
    end

    let(:context) do
      if ::RSpec::Core::Version::STRING.match(/\A(?:3|2\.99)\./)
        mock = double(example: example, request: request, file_path: file_path, full_description: full_description)
      else
        mock = double(example: example, request: request)
      end

      if ::RSpec::Core::Version::STRING.split('.').first == "3"
        allow(mock).to receive_messages(clone: mock)
      else
        mock.stub(clone: mock)
      end
      mock
    end

    let(:example) do
      mock = double(file_path: file_path, full_description: full_description)

      if ::RSpec::Core::Version::STRING.split('.').first == "3"
        allow(mock).to receive_messages(clone: mock)
      else
        mock.stub(clone: mock)
      end
      mock
    end

    let(:file_path) do
      "spec/requests/recipes.md"
    end

    let(:request) do
      double(method: method)
    end

    let(:method) do
      "GET"
    end

    context "with GET /recipes spec" do
      let(:full_description) do
        "Recipe #{method} /recipes returns recipes"
      end

      let(:file_path) do
        "./spec/requests/recipes_spec.rb"
      end

      it "includes links to recipes.md" do
        toc = documents.send(:render_toc)
        expect(toc).to include("[recipes.md](recipes.md)")
        expect(toc).to include("[GET /recipes](recipes.md#get-recipes)")
      end
    end

    context "with GET /admin/recipes spec" do
      let(:full_description) do
        "Admin::Recipe #{method} /admin/recipes returns recipes for administrator"
      end

      let(:file_path) do
        "./spec/requests/admin/recipes_spec.rb"
      end

      it "includes links to admin/recipes.md" do
        toc = documents.send(:render_toc)
        expect(toc).to include("[admin/recipes.md](admin/recipes.md)")
        expect(toc).to include("[GET /admin/recipes](admin/recipes.md#get-adminrecipes)")
      end

      context "with document_path_from_example configuration" do
        around do |example|
          origin = Autodoc.configuration.document_path_from_example
          Autodoc.configuration.document_path_from_example = -> (_example) { "test.md" }
          example.run
          Autodoc.configuration.document_path_from_example = origin
        end

        it "change the naming rule of document file paths" do
          toc = documents.send(:render_toc)
          expect(toc).to include("[test.md](test.md)")
          expect(toc).to include("[GET /admin/recipes](test.md#get-adminrecipes)")
        end
      end
    end
  end
end
