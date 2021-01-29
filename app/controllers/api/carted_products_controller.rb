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

  def destroy
    @carted_product = CartedProduct.find_by(id: params["id"])
    if @carted_product.user_id == current_user.id && @carted_product.status == "Carted"
      @carted_product.status = "removed"
      @carted_product.save
      render "show.json.jb"
    else
      render json: { message: "this carted product does not belong to you" }
    end
  end
end
