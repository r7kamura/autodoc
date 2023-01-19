require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"

Bundler.require(*Rails.groups)
require "autodoc"

module Dummy
  class Application < Rails::Application
    config.load_defaults 7.0
  end
end
