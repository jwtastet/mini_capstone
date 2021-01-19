class Product < ApplicationRecord
  def is_discounted?
    self.price <= 10
  end

  def tax
    tax_price = self.price.to_f * 0.09
  end

  def total
    total = self.price.to_f + self.tax
  end
end
