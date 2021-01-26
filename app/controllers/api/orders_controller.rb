class Api::OrdersController < ApplicationController
  def create
    @order = Order.new({
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
    })
    @order.subtotal = @order.product.price * @order.quantity
    @order.tax = @order.product.tax * @order.quantity
    @order.total = @order.product.total * @order.quantity
    if @order.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: 442
    end
  end

  def index
    @orders = Order.all
    @orders = @orders.where("user_id = #{current_user.id}")

    if current_user.id
      render "index.json.jb"
    else
      render json: { errors: @orders.errors.full_messages }, status: 442
    end
  end

  def show
    @order = Order.find_by(id: params["id"])
    if @order.user.id == current_user.id
      render "show.json.jb"
    else
      render json: { message: "this order does not belong to you." }
    end
  end
end
