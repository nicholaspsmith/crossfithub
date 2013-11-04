class CompletionsController < ApplicationController
  def create
    # Ew code Smell!!!!
    milliseconds = params[:completion]
    wod = params[:completion]
    new_completion = Completion.new
    new_completion.wod_id = wod[:wod_id]
    new_completion.milliseconds = milliseconds[:milliseconds]
    new_completion.user_id = current_user.id

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

  def comment
    @completion = Completion.find(params[:id])
    new_comment = @completion.comments.create(comment_params)
    new_comment.user_id = current_user.id
    new_comment.save!

    render :json => new_comment.to_json, :status => 200
  end

  def destroy_comment
    @comment = Completion.where(
      :id => params[:comment_id],
      :completion_id => params[:completion_id]
    ).first

    @comment.destroy if @comment.user_id == current_user.id 

    render :nothing => true, :status => 200
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
