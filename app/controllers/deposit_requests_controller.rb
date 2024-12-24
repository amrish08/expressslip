class DepositRequestsController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @deposit_request = DepositRequest.new
    end
  
    def create
        @deposit_request = DepositRequest.create!(deposit_request_params.merge(user_id: current_user.id))
      if @deposit_request.save
        redirect_to dashboard_index_path, notice: 'Deposit request submitted successfully.'
      else
        render :new, alert: 'Failed to submit deposit request.'
      end
    end
  
    private
  
    def deposit_request_params
      params.require(:deposit_request).permit(:amount, :payment_system, :reference_no, :deposited_date, :deposit_slip, :remarks, :user)
    end
  end
  