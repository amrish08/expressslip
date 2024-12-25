class AddMissingFieldsToSlipPayment < ActiveRecord::Migration[7.1]
  def change
    add_column :slip_payments, :amount, :decimal
    add_column :slip_payments, :payment_system, :string
    add_column :slip_payments, :reference_no, :string
    add_column :slip_payments, :deposited_date, :date
    add_column :slip_payments, :user_id, :integer
    add_column :slip_payments, :admin_remark, :text
    add_column :slip_payments, :status, :string
    add_column :slip_payments, :transaction_id, :string
    add_column :slip_payments, :transaction_type, :string
    add_column :slip_payments, :item_type, :string
    add_column :slip_payments, :running_balance, :decimal

    add_foreign_key :slip_payments, :users, column: :user_id
  end
end
