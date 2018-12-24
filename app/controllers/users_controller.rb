class UsersController < ApplicationController
  def dashboard
    @cocktail = authorize Cocktail.new
  end
end
