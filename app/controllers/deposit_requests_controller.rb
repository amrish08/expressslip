class DepositRequestsController < ApplicationController
  STATUS_MAPPING = {
    "Pending" => ["no_balance", "processing", "link_processing"], # Example model statuses
    "Approved" => ["completed"],
    "Declined" => ["cancelled"]
    }.freeze

    before_action :authenticate_user!
  
    def new
      @deposit_request = DepositRequest.new
    end
  
    def create
        @deposit_request = DepositRequest.create!(deposit_request_params.merge(user_id: current_user.id))
        @deposit_request.transaction_type = 'deposit request'
      if @deposit_request.save
        redirect_to dashboard_index_path, notice: 'Deposit request submitted successfully.'
      else
        render :new, alert: 'Failed to submit deposit request.'
      end
    end

    def index
      @deposit_requests = DepositRequest.all
  
      # Filter by date range
      if params[:start_date].present? && params[:end_date].present?
        @deposit_requests = @deposit_requests.where(deposited_date: params[:start_date]..params[:end_date])
      end
  
      # Filter by status
      if params[:status].present? && params[:status] != "All"
        mapped_statuses = STATUS_MAPPING[params[:status]]
        @deposit_requests = @deposit_requests.where(status: mapped_statuses) if mapped_statuses.present?
      end
    end
  
    private
  
    def deposit_request_params
      params.require(:deposit_request).permit(:amount, :payment_system, :reference_no, :deposited_date, :deposit_slip, :remarks, :user, :status)
    end
  end
  