class Image < ApplicationRecord
  validates :url, :product_id, presence: true

  def product
    Product.find_by(id: self.product_id)
  end
end
