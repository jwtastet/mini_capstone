class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :carted_products
  has_many :orders

  def orders
    Order.where(user_id: self.id)
  end
end
