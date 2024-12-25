class CreateMedicalCenters < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_centers do |t|
      t.string :country
      t.string :city
      t.string :center_name
      t.string :traveling_country
      t.decimal :price

      t.timestamps
    end
  end
end
