ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../spec/dummy/config/environment", __FILE__)
require "rspec/rails"

Autodoc.configuration.toc = true
Autodoc.configuration.toc_html = true
Autodoc.configuration.path = "spec/dummy/doc"

RSpec.configure do |config|
  # If you"re not using ActiveRecord, or you"d prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end
