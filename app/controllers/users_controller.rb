class UsersController < ApplicationController

  def index
    @completion = Completion.new
    @user = User.find(current_user.id)
    ## will need to set today's wod in here somewhere
    #@current_wod = Wod.find(3)
    # @workouts = Wod.all.by_name
    if params[:search]
      @user = User.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"]).first
      if @user != nil
        render "show"
      end
      @user = @user = User.find(current_user.id)      
    end
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    ## will need to set today's wod in here somewhere
    #@current_wod = Wod.find(3)
  end

  def follow(user)
    Relationship.create(follower:current_user,followed:user)
    render "show"
  end

end
