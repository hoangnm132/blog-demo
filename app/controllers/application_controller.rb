class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "please_login"
    redirect_to login_url
  end

  def load_users
    @user = User.find_by id: params[:id]
    return if @user

    redirect_to root_url
  end
end
