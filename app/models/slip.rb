class Slip < ApplicationRecord
    validates :country, :city, :country_traveling_to, :first_name, :last_name, 
    :dob, :gender, :marital_status, :nationality, :passport_number, 
    :passport_issue_date, :passport_expiry_date, :visa_type, 
    :position_applied_for, presence: true
    validates :passport_number, confirmation: true
    enum slip_type: { normal: 0, night: 1, special: 2 }
  end
  