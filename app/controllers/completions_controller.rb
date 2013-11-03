class CompletionsController < ApplicationController
  def create
    milliseconds = params[:completion]
    wod = params[:completion]
    new_completion = Completion.new
    new_completion.wod_id = wod[:wod_id]
    new_completion.milliseconds = milliseconds[:milliseconds]
    new_completion.user_id = current_user.id
    # need something like this \/ (but better, cause it will actually work)
    new_completion.save!
    redirect_to users_path, notice: "Workout added!"
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
end
