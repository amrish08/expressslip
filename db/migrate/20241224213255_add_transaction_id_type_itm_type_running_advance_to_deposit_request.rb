class AddTransactionIdTypeItmTypeRunningAdvanceToDepositRequest < ActiveRecord::Migration[7.1]
  def change
    add_column :deposit_requests, :transaction_id, :string
    add_column :deposit_requests, :transaction_type, :string
    add_column :deposit_requests, :item_type, :string
    add_column :deposit_requests, :running_balance, :decimal
    add_column :slips, :transaction_id, :string
    add_column :slips, :transaction_type, :string
    add_column :slips, :item_type, :string
    add_column :slips, :running_balance, :decimal
  end
end
