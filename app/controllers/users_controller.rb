class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @completion = Completion.new
    ## will need to set today's wod in here somewhere
    #@current_wod = Wod.find(3)
    # @workouts = Wod.all.by_name
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    ## will need to set today's wod in here somewhere
    #@current_wod = Wod.find(3)
  end

end
