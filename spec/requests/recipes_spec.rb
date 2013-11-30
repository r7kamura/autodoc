require "spec_helper"

describe "Recipes" do
  let(:env) do
    { "HTTP_ACCEPT" => "application/json" }
  end

  let(:params) do
    {}
  end

  describe "GET /recipes/:id" do
    let(:recipe) do
      Recipe.create(name: "test", type: 2)
    end

    context "with valid condition (using Rack::Test)", :autodoc do
      include Rack::Test::Methods

      it "returns the recipe" do
        get "/recipes/#{recipe.id}", params, env
        last_response.status.should == 200
      end
    end
  end

  describe "POST /recipes" do
    before do
      params[:name] = "name"
      params[:type] = 1
    end

    context "without required param" do
      before do
        params.delete(:name)
      end

      it "returns 400" do
        post "/recipes", params, env
        response.status.should == 400
      end
    end

    context "with other typed param" do
      before do
        params[:type] = "x"
      end

      it "returns 400" do
        post "/recipes", params, env
        response.status.should == 400
      end
    end

    context "without non-required param" do
      before do
        params.delete(:type)
      end

      it "creates a new recipe" do
        post "/recipes", params, env
        response.status.should == 201
      end
    end

    context "with valid condition", :autodoc do
      it "creates a new recipe" do
        post "/recipes", params, env
        response.status.should == 201
      end
    end
  end
end
