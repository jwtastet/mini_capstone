class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    @carted_products = CartedProduct.where(user_id: current_user.id)
    @carted_products = @carted_products.where(status: "Carted")

    @order = Order.new({
      user_id: current_user.id,
    })
    @order.save
    subtotal = 0.0
    tax = 0.0
    total = 0.0

    @carted_products.each do |i|
      i.order_id = @order.id
      i.status = "purchased"
      i.save
      subtotal = subtotal + i.product.price * i.quantity
      tax = tax + i.product.tax * i.quantity
      total = total + i.product.total * i.quantity
    end
    @order.subtotal = subtotal
    @order.tax = tax
    @order.total = total
    @order.save
    render "show.json.jb"
  end

  def index
    @orders = Order.all
    @orders = @orders.where("user_id = #{current_user.id}")
    render "index.json.jb"
  end

  def show
    @order = Order.find_by(id: params["id"])
    if @order.user_id == current_user.id
      render "show.json.jb"
    else
      render json: { message: "this order does not belong to you." }
    end
  end
end
