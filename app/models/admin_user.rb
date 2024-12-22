class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

         validates :user_id, presence: true, uniqueness: true
         validates :password, presence: true, length: { minimum: 6 }
end
