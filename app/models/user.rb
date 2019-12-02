class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  # after_update :admin_user_exist?

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, uniqueness: true, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  private
  # def admin_user_exist?
  #   self.name = "no admin" unless User.pluck("admin").include?(true)
  # end
end
