class Api::ProductsController < ApplicationController
  def index
    @products = Product.all

    p current_user

    render "index.json.jb"
  end

  def show
    input_value = params["id"]
    @product = Product.find_by id: input_value
    render "show.json.jb"
  end

  def create
    @product = Product.new({
      name: params["name"],
      brewery: params["brewery"],
      description: params["description"],
      size: params["size"],
      abv: params["abv"],
      price: params["price"],

    })
    if @product.save
      @image = Image.create!(product_id: @product.id, url: params[:url])
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    input_value = params["id"]
    @product = Product.find_by id: input_value

    @product.name = params["name"] || @product.name
    @product.brewery = params["brewery"] || @product.brewery
    @product.description = params["description"] || @product.description
    @product.abv = params["abv"] || @product.abv
    @product.size = params["size"] || @product.size

    @product.price = params["price"] || @product.price
    @product.save

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    input_value = params["id"]
    @products = Product.find_by id: input_value

    @products.destroy
    render json: { message: "Product DESTROYED!" }
  end
end
