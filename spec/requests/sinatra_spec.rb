require 'sinatra_helper'

include Rack::Test::Methods

def app
  App
end

describe "Recipes" do
  let(:env) do
    { "HTTP_ACCEPT" => "application/json" }
  end

  let(:params) do
    {
      name: "name",
      type: 1,
    }
  end

  describe "POST /recipes", :type => :request do
    context "without required param" do
      before do
        params.delete(:name)
      end

      it "returns 400" do
        post "/recipes", params, env
        last_response.status.should == 400
      end
    end

    context "with other typed param" do
      before do
        params[:type] = "x"
      end

      it "returns 400" do
        post "/recipes", params, env
        last_response.status.should == 400
      end
    end

    context "without non-required param" do
      before do
        params.delete(:type)
      end

      it "creates a new recipe" do
        post "/recipes", params, env
        last_response.status.should == 201
      end
    end

    context "with valid condition", :autodoc do
      it "creates a new recipe" do
        post "/recipes", params, env
        last_response.status.should == 201
      end
    end

    context "with valid condition (client using Rack::Test)", :autodoc do
      include Rack::Test::Methods
      before do
        header 'Accept', 'application/json'
      end

      it "creates a new recipe" do
        post "/recipes", params
        last_response.status.should == 201
      end
    end
  end
end

