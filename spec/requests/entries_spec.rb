require "spec_helper"

describe "Entries" do
  include Rack::Test::Methods

  let(:env) do
    { "HTTP_ACCEPT" => "application/json" }
  end

  let(:params) do
    {}
  end

  let(:app) do
    lambda do |env|
      [
        200,
        { "Content-Type" => "application/json" },
        [
          [
            {
              title: "Test Title",
              body: "Lorem Ipsum",
            },
          ].to_json,
        ],
      ]
    end
  end

  describe "GET /entries" do
    context "with Rack::Test", autodoc: true do
      it "returns entries" do
        get "/entries", params, env
        last_response.status.should == 200
      end
    end
  end
end
