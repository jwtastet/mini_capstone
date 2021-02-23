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

  def primary_image_url
    if images.length > 0
      images[0].url
    else
      "https://www.google.com/search?q=no+image+icon&rlz=1C5CHFA_enUS935US935&sxsrf=ALeKk02oJ964UmjbhbqDZayFX-AODw1h6Q:1613440184121&tbm=isch&source=iu&ictx=1&fir=srhpoiIpowpbOM%252CO0ee8H4WL2H1wM%252C_&vet=1&usg=AI4_-kQ3Nv4e6gYXelbtwc8unymkyAOaFQ&sa=X&ved=2ahUKEwiKnqmIpe3uAhUDFFkFHUYIAgcQ9QF6BAgKEAE#imgrc=srhpoiIpowpbOM"
    end
  end

  scope :discount, -> { where("price < 20") }

  scope :name_search, ->(search) { where("name ILIKE ?", "%#{search}%") }
end
