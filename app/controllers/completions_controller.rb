class CompletionsController < ApplicationController
  def create
    minutes = params[:completion][:minutes].to_i
    milliseconds = minutes * 60 * 1000

    seconds = params[:completion][:seconds].to_i
    milliseconds += seconds * 1000
    
    #milliseconds= params[:completion]
    wod = params[:completion]
    
    new_completion = Completion.new do |c|
      c.wod_id = wod[:wod_id]
      c.milliseconds = milliseconds
      c.user_id = current_user.id
    end

    if new_completion.save!
      track_activity new_completion

      respond_to do |format|
        format.html { redirect_to users_path, notice: "Workout added!" }
        format.js
      end

    else
      redirect_to users_path, notice: "Workout not added"
    end
  end

  def upvote
    @completion = Completion.find(params[:id])
    @user = @completion.user

    @completion.liked_by current_user

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def downvote
    @completion = Completion.find(params[:id])
    @user = @completion.user

    @completion.disliked_by current_user

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end


end
