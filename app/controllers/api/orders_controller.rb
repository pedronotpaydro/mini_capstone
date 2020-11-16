class Api::OrdersController < ApplicationController
  def create
    carted_products = current_user.carted_products.where(status: "carted")
    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    @order.save
    carted_products.update_all(status: "purchased", order_id: order.id)
    render "show.json.jb"
    # else
    #   render json: [], status: :unauthorized
    # end
  end

  def index
    if current_user
      @order = current_user.orders
      render "index.json.jb"
    else
      render json: [], status: :unauthorized
    end
  end
end
