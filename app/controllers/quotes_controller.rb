class QuotesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @quotes = Quote.where.not(id: @user.favorites.select(:quote_id))
    @favorites = Favorite.where(user_id: session[:user_id])
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to '/quotes'
    else
      flash[:errors] = @quote.errors.full_messages
      redirect_to :back
    end
  end

  private
  def quote_params
    params.require(:quote).permit(:author, :quote).merge(user: current_user)
  end

end
