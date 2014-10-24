require "spec_helper"

describe Autodoc::Documents do
  describe "#render_toc" do
    before do
      documents.append(context, example)
    end

    let(:documents) do
      Autodoc::Documents.new
    end

    let(:context) do
      mock = double(example: example, request: request)
      mock.stub(clone: mock)
      mock
    end

    let(:example) do
      double(file_path: file_path, full_description: full_description)
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
        toc.should include("[recipes.md](recipes.md)")
        toc.should include("[GET /recipes](recipes.md#get-recipes)")
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
        toc.should include("[admin/recipes.md](admin/recipes.md)")
        toc.should include("[GET /admin/recipes](admin/recipes.md#get-adminrecipes)")
      end
    end
  end
end
