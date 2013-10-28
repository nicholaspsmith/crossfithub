class CompletionsController < ApplicationController
  def create
    milliseconds = params[:completion]
    new_completion = Completion.new
    new_completion.milliseconds = milliseconds[:milliseconds]
    new_completion.user_id = current_user.id
    new_completion.wod = @current_wod
    new_completion.save!
    redirect_to users_path, notice: "Workout added!"
  end
end
