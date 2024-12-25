class SessionsController < ApplicationController
  protect_from_forgery except: :create
  #before_action :authenticate_user!
  
  def new
    if current_user.present?
      redirect_to dashboard_index_path
    end
  end

  def create
    user = User.find_by(userid: params[:session][:userid])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Invalid userid or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully'
  end
end
