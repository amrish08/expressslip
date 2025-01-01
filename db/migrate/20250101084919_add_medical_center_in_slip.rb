class AddMedicalCenterInSlip < ActiveRecord::Migration[7.1]
  def change
    add_column :slips, :medical_center, :string
  end
end
