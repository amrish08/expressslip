class ProfileController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
  end

  def change_password
    @user = current_user
  end

  def post_password
    @user = current_user
    find_user = User.find_by_userid(params[:userid])
  
    if find_user.update(password: params[:password])
      flash.now[:success] = "Password updated successfully!"
    else
      flash.now[:error] = "Failed to update the password. Please try again."
    end
  
    # Re-render the same view to show the flash message
    render :change_password # Replace `:edit_password` with the name of your template
  end
  

end
