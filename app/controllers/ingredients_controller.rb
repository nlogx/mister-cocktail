class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[show destroy]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path, notice: "#{@ingredient.name} added!"
    else
      render :new
    end
  end

  def index
    @ingredients = Ingredient.all.reverse
  end

  def destroy
    # @ingredients = Ingredient.all.reverse
    # if Dose.where(ingredient: @ingredient).empty?
    @ingredient.destroy
    redirect_to ingredients_path
    # else
    #   # canot delete
    #   raise
    # end
  end

  # def show
  # end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
