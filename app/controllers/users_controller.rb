class UsersController < ApplicationController

  def index
    @completion = Completion.new
    ## will need to set today's wod in here somewhere
    #@current_wod = Wod.find(3)
    # @workouts = Wod.all.by_name
    if params[:search]
      #binding.pry
      @user = User.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"]).first
      render "show"
    else
      @user = User.find(current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    ## will need to set today's wod in here somewhere
    #@current_wod = Wod.find(3)
  end

end
