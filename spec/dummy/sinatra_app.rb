# encoding: UTF-8
require "sinatra/base"
require "weak_parameters/sinatra"

class Recipe
  def self.create params
    params
  end
end

class App < Sinatra::Base
  include WeakParameters::Sinatra
  use WeakParameters::Middleware

  post '/recipes' do
    validates do
      any :object
      string :name, required: true, except: %w[invalid wrong]
      integer :type, only: 0..3
      integer :number, only: [0, 1]
      boolean :flag
      hash :config
      array :tags
      float :rate
      string :zip_code do |value|
        value =~ /\A\d{3}-\d{4}\z/
      end
    end
    
    [201, { "Content-Type" => "text/xml; charset=utf-8"}, Recipe.create(params).to_xml]
  end
  
  def validation_error exception, env
    [400, { "Content-Type" => "text/xml; charset=utf-8" }, [ "<error>#{exception.message}</error>"]]
  end

end
