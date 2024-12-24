class CreateSlipPayments < ActiveRecord::Migration[7.1]
  def change
    create_table :slip_payments do |t|
      t.string :payment_link
      t.text :remarks

      t.timestamps
    end
  end
end
