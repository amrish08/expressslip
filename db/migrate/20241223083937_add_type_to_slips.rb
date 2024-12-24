class AddTypeToSlips < ActiveRecord::Migration[7.1]
  def change
    add_column :slips, :slip_type, :integer
    add_reference :slips, :user, foreign_key: true
  end
end
