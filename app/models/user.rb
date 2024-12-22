class User < ApplicationRecord
    has_secure_password
    validates :userid, presence: true, uniqueness: true
end
