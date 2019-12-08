class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  before_update :admin_user_exist?

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, uniqueness: true, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  private
  def admin_user_exist?
    # throw(:abort) unless User.pluck("admin").include?(true)
    errors.add(:base, "admin_user must exist")
    throw(:abort) if User.pluck("admin").count(true) == 1 && User.find(self.id).admin == true && self.admin == false
  end
end
