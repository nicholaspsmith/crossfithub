class CommentsController < ApplicationController

  def create
    @completion = Completion.find(params[:completion_id])
    @comment = Comment.new
    @comment.text = params[:comment][:text]
    @comment.user_id = current_user.id
    @comment.completion_id = params[:completion_id]

    if @comment.save
      respond_to do |format|
        format.js { render layout: false }
        format.html { redirect_to root_path }
      end
    end
    # render :json => new_comment.to_json, :status => 200
  end

  def delete
    @comment = Completion.where(
      :id => params[:comment_id],
      :completion_id => params[:completion_id]
    ).first

    @comment.destroy if @comment.user_id == current_user.id 

    render :nothing => true, :status => 200
  end

  def show

  end

  private

  def comment_params
    params.permit(:text)
  end
end
