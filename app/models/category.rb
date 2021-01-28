class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products

  def category_products
    CategoryProduct.where(category_id: self.id)
  end
end
