class CompletionsController < ApplicationController
# TODO: authenticate use with before_filter

  def create
    redirect_to user_path(current_user)
  end

  def index
  end
end
