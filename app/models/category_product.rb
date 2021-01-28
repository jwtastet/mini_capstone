class CategoryProduct < ApplicationRecord
  belongs_to :category
  belongs_to :product

  def category
    Category.find_by(id: self.category_id)
  end

  def product
    Product.find_by(id: self.product_id)
  end
end
