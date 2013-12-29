require 'autodoc/documents'

describe Autodoc::Documents do
  describe "render_toc" do
    before do
      Autodoc::Document.any_instance.stub(:pathname){ Pathname.new(Autodoc.configuration.path) + pathname }
      Autodoc::Document.any_instance.stub(:title){ title }

      @documents = Autodoc::Documents.new
      @documents.append(double(:context))
    end

    describe "GET /recipes in ./recipes.md" do
      let(:title) { "GET /recipes" }
      let(:pathname) { "./recipes.md" }

      subject { @documents.send(:render_toc) }
      it { should include("[recipes.md](recipes.md)") }
      it { should include("[GET /recipes](recipes.md#get-recipes)") }
    end

    describe "GET /admin/recipes in ./admin/recipes.md" do
      let(:title) { "GET /admin/recipes" }
      let(:pathname) { "./admin/recipes.md" }

      subject { @documents.send(:render_toc) }
      it { should include("[admin/recipes.md](admin/recipes.md)") }
      it { should include("[GET /admin/recipes](admin/recipes.md#get-adminrecipes)") }
    end
  end
end
