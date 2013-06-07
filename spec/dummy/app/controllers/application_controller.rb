class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :json

  rescue_from WeakParameters::ValidationError do
    head 400
  end
end
