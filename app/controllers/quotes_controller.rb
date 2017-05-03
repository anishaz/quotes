class QuotesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @quotes = Quote.where.not(id: @user.favorites.select(:quote_id))
    @favorites = Favorite.where(user_id: session[:user_id])
  end
end
