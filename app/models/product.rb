class Product < ApplicationRecord
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

  scope :discount, -> { where("price < 20") }

  scope :name_search, ->(search) { where("name ILIKE ?", "%#{search}%") }
end
