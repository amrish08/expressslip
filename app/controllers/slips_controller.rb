class SlipsController < ApplicationController
    def new
      @slip = Slip.new
    end
  
    def create
      @slip = Slip.new(slip_params)
      if @slip.save
        redirect_to root_path, notice: 'Slip created successfully!'
      else
        flash.now[:alert] = 'Error saving the slip.'
        render :new
      end
    end
  
    private
  
    def slip_params
      params.require(:slip).permit(:country, :city, :country_traveling_to, :first_name, :last_name, :dob, :gender, :marital_status, :nationality, :passport_number, :confirm_passport, :passport_issue_date, :passport_expiry_date, :visa_type, :national_id, :position_applied_for, :remarks, :confirmation)
    end
  end
  