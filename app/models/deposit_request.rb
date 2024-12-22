class DepositRequest < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :payment_system, presence: true
  validates :deposited_date, presence: true

  has_one_attached :deposit_slip
end
