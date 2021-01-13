class Api::ProductsController < ApplicationController
  def all_products
    @all_products = Product.all
    render "products_views.json.jb"
  end
end
