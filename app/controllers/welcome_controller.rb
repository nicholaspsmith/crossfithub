class WelcomeController < ApplicationController

  def index
    @id = User.where(current_user.email)
  end

end
