class Recipe < ActiveRecord::Base
  self.inheritance_column = :_type
end
