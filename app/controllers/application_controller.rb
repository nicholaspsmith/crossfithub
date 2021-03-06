class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:account_update) << :profile_pic
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :profile_pic
  end

  def track_activity(trackable, action = params[:action])
    current_user.activities.create! action: action, trackable: trackable
  end

  # Commented out because it breaks current_user for some reason
  # private
  #   def current_user
  #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   end
  # helper_method :current_user
end
