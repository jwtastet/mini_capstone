class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 2..500 }

  def is_discounted?
    self.price <= 10
  end

  def tax
    tax_price = self.price.to_f * 0.09
  end

  def total
    total = self.price.to_f + self.tax
  end

  def supplier
    Supplier.find_by(id: self.supply_id)
  end

  def images
    Image.where(product_id: self.id)
  end

  def orders
    Order.where(product_id: self.id)
  end

  def category_products
    CategoryProduct.where(product_id: self.id)
  end

  scope :discount, -> { where("price < 20") }

  scope :name_search, ->(search) { where("name ILIKE ?", "%#{search}%") }
end
