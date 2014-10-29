require "spec_helper"

describe "Admin::Entries", type: :request do
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

  describe "GET /admin/entries" do
    context "with Rack::Test", autodoc: true do
      it "returns entries" do
        get "/admin/entries", params, env
        expect(last_response.status).to eq(200)
      end
    end
  end
end
