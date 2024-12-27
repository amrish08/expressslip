class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
       devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

         validates :user_id, presence: true, uniqueness: true
         validates :password, presence: true, length: { minimum: 6 }

       def self.ransackable_attributes(auth_object = nil)
              %w[id email user_id created_at updated_at]
       end
end
