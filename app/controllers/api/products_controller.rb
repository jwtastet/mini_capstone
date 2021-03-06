class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all

    if params[:search]
      @products = @products.name_search(params[:search])
    end

    if params[:sort] && params[:sort_order]
      if params[:sort].upcase == "PRICE" && params[:sort_order].upcase == "ASC"
        @products = @products.order("price")
      end
    end

    if params[:sort] && params[:sort_order]
      if params[:sort].upcase == "PRICE" && params[:sort_order].upcase == "DESC"
        @products = @products.order("price DESC")
      end
    end

    if params[:sort] == nil
      @products = @products.order("id ASC")
    end

    if params[:discount]
      @products = @products.discount
    end

    render "index.json.jb"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.json.jb"
  end

  def create
    @product = Product.new({
      name: params["name"],
      price: params["price"].to_i,
      description: params["description"],
    })
    if @product.save
      Image.create(product_id: @product.id, url: params[:image_url])
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.description = params["description"] || @product.description
    @product.supply_id = params["supply_id"] || @product.supply_id
    @product.save
    render "show.json.jb"
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    @products = Product.all
    render "index.json.jb"
  end
end
