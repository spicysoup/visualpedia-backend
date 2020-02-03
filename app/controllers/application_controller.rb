class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :fetch_user

  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by( id: session[:user_id] )
    end

    unless @current_user.present?
      session[:user_id] = nil
    end
  end

  def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  end

  def check_if_admin
    unless @current_user.present? && @current_user.admin?
      flash[:error] = 'You do not have authorization to view this page.'
    redirect_to root_path
    end
  end
end