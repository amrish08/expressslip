class CreateDepositRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :deposit_requests do |t|
      t.decimal :amount
      t.string :payment_system
      t.string :reference_no
      t.date :deposited_date
      t.string :deposit_slip
      t.text :remarks
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
