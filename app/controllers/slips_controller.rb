class SlipsController < ApplicationController
  before_action :authenticate_user!
  
    def new
      @slip = Slip.new(slip_type: params[:type])
    end
  
    def create
      @slip = Slip.new(slip_params)
      @slip.user_id = current_user.id # Assuming you have a current_user method
      @slip.slip_type = params[:slip][:slip_type]
      if @slip.save
        redirect_to dashboard_index_path, notice: 'Slip created successfully!'
      else
        flash.now[:alert] = 'Error saving the slip.'
        render :new
      end
    end
  
    private
  
    def slip_params
      params.require(:slip).permit(:country, :city, :country_traveling_to, :first_name, :last_name, :dob, :gender, :marital_status, :nationality, :passport_number, :confirm_passport, :passport_issue_date, :passport_expiry_date, :visa_type, :national_id, :position_applied_for, :remarks, :confirmation, :type, :user_id)
    end
  end
  