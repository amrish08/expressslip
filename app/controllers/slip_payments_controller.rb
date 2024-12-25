class SlipPaymentsController < ApplicationController
  before_action :authenticate_user!

    def new
      @slip_payment = SlipPayment.new
    end
  
    def create
      @slip_payment = SlipPayment.new(slip_payment_params)
      @slip_params.transaction_type = 'slip payment'
      if @slip_payment.save
        redirect_to dashboard_index_path, notice: 'Payment information saved successfully!'
      else
        render :new, alert: 'Something went wrong. Please try again.'
      end
    end
  
    private
  
    def slip_payment_params
      params.require(:slip_payment).permit(:payment_link, :remarks)
    end
  end
  