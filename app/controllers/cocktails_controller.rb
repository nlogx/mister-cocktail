class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show destroy]

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Successfully added!'
    else
      render :new
    end
  end

  def index
    @cocktails = Cocktail.all.reverse
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  def show
    @dose = Dose.new
    @doses = Dose.where(cocktail_id: @cocktail.id).reverse
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
