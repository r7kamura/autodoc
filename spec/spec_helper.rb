ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../spec/dummy/config/environment", __FILE__)
require "rspec/rails"
require "rspec/autorun"

RSpec.configure do |config|
  # If you"re not using ActiveRecord, or you"d prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  config.treat_symbols_as_metadata_keys_with_true_values = true
end
