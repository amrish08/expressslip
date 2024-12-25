class AddUserRemarksStatusToDepositRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :deposit_requests, :admin_remark, :text
    add_column :deposit_requests, :status, :string, default: 'processing'
  end
end
