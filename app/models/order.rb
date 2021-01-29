class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def product
    Product.find_by(id: self.product_id)
  end

  def user
    User.find_by(id: self.user_id)
  end
end
