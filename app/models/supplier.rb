class Supplier < ApplicationRecord
  def products
    Product.where(supply_id: self.id)
  end
end
