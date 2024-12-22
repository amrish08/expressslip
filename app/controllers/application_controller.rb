class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
      
      def user_signed_in?
        current_user.present?
      end

      def authenticate_user!
        redirect_to login_path unless current_user
      end
      
      helper_method :current_user, :user_signed_in?      
end
