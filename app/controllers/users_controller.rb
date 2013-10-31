class UsersController < ApplicationController

  def index
    @completion = Completion.new
    ## will need to set today's wod in here somewhere
    if params[:search]
      @user = User.search(params[:search])
    end
    
    render "show" if @user != nil
    @user = User.find(current_user.id)
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
