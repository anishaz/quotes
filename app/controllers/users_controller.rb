class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :delete]

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/quotes'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation, :date_of_birth)
  end

  def require_correct_user
  user = User.find(params[:id])
  redirect_to current_user if current_user != user
  end

end
