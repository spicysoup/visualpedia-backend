class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by( email: params[:email] )

    if user.present? && user.authenticate( params[:password] )   # successful login
      session[:user_id] = user.id
      redirect_to dashboard_path
    else   # failed login
      flash[:error] = 'Invalid credentials. Please try again.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end