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
end
