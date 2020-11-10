class Api::OrdersController < ApplicationController
  def create
    if current_user
      @order = Order.new(
        user_id: current_user.id,
        product_id: params["product_id"],
        quantity: params["quantity"],
        # user_id: params["user_id"],
        # user_id: params["user_id"],
      )
      @order.save
      render "show.json.jb"
    else
      render json: []
    end
  end
end
