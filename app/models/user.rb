class User < ApplicationRecord
    attr_accessor :plaintext_password

    before_save :store_plaintext_password
    has_secure_password
    validates :userid, presence: true, uniqueness: true

    def self.ransackable_attributes(auth_object = nil)
        %w[id userid created_at updated_at]
    end

    private

    def store_plaintext_password
      self.plaintext_password = password if new_record? && password.present?
    end
end
