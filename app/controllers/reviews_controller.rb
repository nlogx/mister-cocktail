class ReviewsController < ApplicationController
  def create
    @cocktail = authorize Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      respond_to do |format|
        format.html { redirect_to @cocktail }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'cocktail/show' }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
