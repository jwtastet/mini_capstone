class Api::CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(user_id: current_user.id)
    render "index.json.jb"
  end

  def create
    @carted_product = CartedProduct.new({
      status: "Carted",
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
    })
    if @carted_product.save
      render "show.json.jb"
    else
      render json: { errors: @carted_product.errors.full_message }, status: 442
    end
  end
end
