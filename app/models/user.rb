class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def orders
    Order.where(user_id: self.id)
  end
end
