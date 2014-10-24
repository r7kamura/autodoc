require "spec_helper"

describe "Recipes", type: :request do
  let(:env) do
    { "ACCEPT" => "application/json", "CONTENT_TYPE" => "application/json" }
  end

  let(:params) do
    {}
  end


  describe "GET /recipes/:id" do
    let(:recipe) do
      Recipe.create(name: "test", type: 2)
    end

    context "with valid condition (using Rack::Test)", autodoc: true do
      before do
        env["Content-Type"] = "application/json"
      end

      include Rack::Test::Methods

      let(:app) do
        Dummy::Application
      end

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
        post "/recipes", params.to_json, env
        response.status.should == 400
      end
    end

    context "with other typed param" do
      before do
        params[:type] = "x"
      end

      it "returns 400" do
        post "/recipes", params.to_json, env
        response.status.should == 400
      end
    end

    context "without non-required param" do
      before do
        params.delete(:type)
      end

      it "creates a new recipe" do
        post "/recipes", params.to_json, env
        response.status.should == 201
      end
    end

    context "with valid condition", autodoc: true do
      let(:description) do
        <<-EOS
          Creates
          a
          new
          recipe!
        EOS
      end

      it "creates a new recipe" do
        post "/recipes", params.to_json, env
        response.status.should == 201
      end
    end
  end
end
