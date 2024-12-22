class DashboardController < ApplicationController
  before_action :require_login

  def index
  end

  private

  def require_login
    unless session[:user_id]
      redirect_to login_path, alert: 'You must be logged in to access this section'
    end
  end
end
