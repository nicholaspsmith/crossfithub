class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    #@name = User.where(email: current_user.email).first.name
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

end
