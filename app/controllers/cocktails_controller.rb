class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_cocktail, only: %i[show destroy]

  def index
    @cocktail = authorize Cocktail.new
    @cocktails = policy_scope(Cocktail).order(created_at: :desc)
  end

  def create
    @cocktail = authorize Cocktail.new(cocktail_params)
    @cocktail.user_id = current_user.id
    if @cocktail.save
      redirect_to @cocktail
    else
      raise
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  def show
    @doses = policy_scope(Dose).where(cocktail_id: @cocktail.id)
    @review = Review.new
  end

  private

  def set_cocktail
    @cocktail = authorize Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
