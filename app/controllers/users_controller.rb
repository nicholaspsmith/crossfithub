class UsersController < ApplicationController

  def index
    @users = User.all
    @name = User.where(email: current_user.email).first.name
  end

  def show
    @user = User.find(params[:id])
  end
  
end
