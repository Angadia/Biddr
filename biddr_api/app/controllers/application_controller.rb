class ApplicationController < ActionController::API

  private
  
  def authenticate_user!
    unless user_signed_in? 
      render json: { error: "Please Sign In" }, status: 401
    end
  end

  def user_signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end
end
