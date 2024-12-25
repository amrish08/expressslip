class TransactionsController < ApplicationController
    def index
      @deposit_requests = DepositRequest.all
      @slip_payments = SlipPayment.all

      if params[:transaction_type].present? && params[:transaction_type] != "All"
        @deposit_requests = @deposit_requests.where(transaction_type: params[:transaction_type])
        @slip_payments = @slip_payments.where(transaction_type: params[:transaction_type])
        @transactions = @deposit_requests + @slip_payments
      end
  
      # Filter by date range
      if params[:start_date].present? && params[:end_date].present?
        @deposit_requests = @deposit_requests.where(
          created_at: params[:start_date].to_date..params[:end_date].to_date
        )
        @slip_payments = @slip_payments.where(
            created_at: params[:start_date].to_date..params[:end_date].to_date)
        @transactions = @deposit_requests + @slip_payments
      end
    end
  end
  