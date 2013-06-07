class RecipesController < ApplicationController
  validates :create do
    string :name, required: true
    integer :type
  end

  def show
    respond_with Recipe.find(params[:id])
  end

  def create
    respond_with Recipe.create(params.slice(:name, :type))
  end
end
