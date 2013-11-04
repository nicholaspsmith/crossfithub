class CommentsController < ApplicationController

  def create
    # @completion = Completion.find(params[:completion_id])
    new_comment = Comment.new
    new_comment.text = params[:comment][:text]
    new_comment.user_id = current_user.id
    new_comment.completion_id = params[:completion_id]

    if new_comment.save
      respond_to do |format|
        format.js { render layout: false }
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
