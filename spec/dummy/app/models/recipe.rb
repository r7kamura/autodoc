class Recipe < ActiveRecord::Base
  attr_accessible :name, :type
  self.inheritance_column = :_type
end
