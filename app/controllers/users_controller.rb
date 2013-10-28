class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @completion = Completion.new
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

end
