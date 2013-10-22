class RecipesController < ApplicationController
  validates :create do
    string :name, required: true, except: %w[alice bob]
    integer :type, only: 1..3
  end

  def show
    respond_with Recipe.find(params[:id])
  end

  def create
    respond_with Recipe.create(params.slice(:name, :type))
  end
end
