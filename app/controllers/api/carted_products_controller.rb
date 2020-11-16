class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = CartedProduct.all
  end

  def create
    @carted_products = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )

    # if @carted_products.save
    #   render "show.json.jb"
    # else
    #   render json: { errors: @carted_products.errors.full_messages }, status: :unprocessable_entity
    # end
    @carted_products.save
    render "show.json.jb"
  end

  def destroy
    carted_product = current_user.carted_products.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    render json: { status: "Carted Product Sucessfully REMOVED" }
  end
end
