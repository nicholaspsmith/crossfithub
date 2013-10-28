class UsersController < ApplicationController

  def index
    @user = current_user
    # redirect_to @user
    # raise @user.inspect
    # @name = User.where(email: current_user.email).first.name
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

end
