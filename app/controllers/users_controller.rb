class UsersController < ApplicationController
  before_action :authenticate_user!

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

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'Your profile was successfully updated.' }
        format.json 
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

    # redirect_to root_path
  end

end
