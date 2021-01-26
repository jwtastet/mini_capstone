class Order < ApplicationRecord
  def product
    Product.find_by(id: self.product_id)
  end

  def user
    User.find_by(id: self.user_id)
  end
end
