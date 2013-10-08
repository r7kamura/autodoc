require "spec_helper"

describe Autodoc::Document do
  describe ".render" do
    subject do
      described_class.render(example, request, response)
    end

    let(:example) do
      double(
        description: description,
        full_description: "#{method} #{path} #{description}",
      )
    end

    let(:description) do
      "returns a recipe"
    end

    let(:request) do
      double(
        body: StringIO.new,
        params: {},
        method: method,
        path: path,
      )
    end

    let(:response) do
      double(
        body: response_body,
        headers: {},
        status: 200,
      )
    end

    let(:method) do
      "GET"
    end

    let(:path) do
      "/recipes/1"
    end

    let(:response_body) do
      { name: "recipe 1" }.to_json
    end

    context "without Autodoc.configuration.template" do
      it "uses default template" do
        should == <<-EOF.strip_heredoc
          ## GET /recipes/1
          Returns a recipe.

          ### request
          ```
          GET /recipes/1
          ```

          ### response
          ```ruby
          Status: 200
          response: 
          {
            "name": "recipe 1"
          }
          ```

        EOF
      end
    end

    context "with Autodoc.configuration.template" do
      before do
        Autodoc.configuration.template = <<-EOF.strip_heredoc
          ### request
          ```
          <%= method %> <%= path %>
          ```
          <%= request_body_section %>
          ### response
          ```ruby
          Status: <%= response_status %><%= response_headers %>
          response: <%= response_body %>
          ```

          ## <%= method %> <%= path %>
          <%= description %>
          <%= parameters_section %>
        EOF
      end

      after do
        Autodoc.configuration.reset
      end

      it "uses custom template" do
        should == <<-EOF.strip_heredoc
          ### request
          ```
          GET /recipes/1
          ```

          ### response
          ```ruby
          Status: 200
          response: 
          {
            "name": "recipe 1"
          }
          ```

          ## GET /recipes/1
          Returns a recipe.

        EOF
      end
    end
  end
end
