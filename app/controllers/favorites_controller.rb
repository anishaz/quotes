class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(favorite_params)
    redirect_to "/quotes"
  end

  def destroy
    @favorite = Favorite.find(params[:id]).destroy
    redirect_to "/quotes"
  end

  private
  def favorite_params
    params.require(:favorite).permit(:quote_id).merge(user: current_user)
  end
end
