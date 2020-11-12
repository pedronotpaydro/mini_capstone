class Api::OrdersController < ApplicationController
  def create
    calculated_subtotal = 
    calculated_tax = 
    calculated_total = 
    if current_user
      @order = Order.new(
        user_id: current_user.id,
        product_id: params["product_id"],
        quantity: params["quantity"],
        # subtotal:
        # tax:
        # total:
      )
      @order.save
      render "show.json.jb"
    else
      render json: [], status: :unauthorized
    end
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
