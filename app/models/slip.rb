class Slip < ApplicationRecord
    validates :country, :city, :country_traveling_to, :first_name, :last_name, 
    :dob, :gender, :marital_status, :nationality, :passport_number, 
    :passport_issue_date, :passport_expiry_date, :visa_type, 
    :position_applied_for, presence: true
    validates :passport_number, confirmation: true
    enum slip_type: { normal: 0, night: 1, special: 2 }

    # def self.ransackable_attributes(auth_object = nil)
    #   %w[id user_id country city country_traveling_to first_name last_name dob gender marital_status nationality passport_number confirm_password passport_issue_date passport_expiry_date visa_type national_id position_applied_for remarks confirmation created_at updated_at slip_type user_id transaction_id transaction_type item_type running_balance]
    # end
    def self.ransackable_attributes(auth_object = nil)
      ["city", "confirm_passport", "confirmation", "country", "country_traveling_to", "created_at", "dob", "first_name", "gender", "id", "id_value", "item_type", "last_name", "marital_status", "national_id", "nationality", "passport_expiry_date", "passport_issue_date", "passport_number", "position_applied_for", "remarks", "running_balance", "slip_type", "transaction_id", "transaction_type", "updated_at", "user_id", "visa_type"]
    end
  end
  