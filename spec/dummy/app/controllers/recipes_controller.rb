class RecipesController < ApplicationController
  validates :create do
    string :name, required: true, except: %w[alice bob]
    integer :type, only: 1..3
  end

  def show
    render json: Recipe.find(params[:id])
  end

  def create
    respond_with Recipe.create(params.permit(:name, :type))
  end
end
