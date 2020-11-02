class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def first_product_action
    @first = Product.first
    render "first.json.jb"
  end

  def show
    input_value = params["id"]
    @products = Product.find_by id: input_value
    render "show.json.jb"
  end

  def create
    @products = Product.new({
      name: params["name"],
      brewery: params["brewery"],
      description: params["description"],
      size: params["size"],
      abv: params["abv"],
      price: params["price"],
      image_url: params["image"],
    })
    @products.save

    render "show.json.jb"
  end

  def update
    input_value = params["id"]
    @products = Product.find_by id: input_value

    @products.name = params["name"] || @products.name
    @products.brewery = params["brewery"] || @products.brewery
    @products.description = params["description"] || @products.description
    @products.abv = params["abv"] || @products.abv
    @products.size = params["size"] || @products.size
    @products.image_url = params["image_url"] || @products.image_url
    @products.save

    render "show.json.jb"
  end

  def destroy
    input_value = params["id"]
    @products = Product.find_by id: input_value

    @products.destroy
    render json: { message: "Product DESTROYED!" }
  end
end
