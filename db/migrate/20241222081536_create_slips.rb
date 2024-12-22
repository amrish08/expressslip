class CreateSlips < ActiveRecord::Migration[7.1]
  def change
    create_table :slips do |t|
      t.string :country
      t.string :city
      t.string :country_traveling_to
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :gender
      t.string :marital_status
      t.string :nationality
      t.string :passport_number
      t.string :confirm_passport
      t.date :passport_issue_date
      t.date :passport_expiry_date
      t.string :visa_type
      t.string :national_id
      t.string :position_applied_for
      t.text :remarks
      t.boolean :confirmation

      t.timestamps
    end
  end
end
