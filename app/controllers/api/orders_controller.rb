class Api::OrdersController < ApplicationController
  def create
    carted_products = current_user.carted_products.where(status: "carted")

    @order = Order.new(
      user_id: current_user.id,
    )
    @order.save
    carted_products.update_all(status: "purchased", order_id: @order.id)
    @order.update_totals
    render "show.json.jb"
    # else
    #   render json: [], status: :unauthorized
    # end
  end

  def index
    @order = current_user.orders
    render "index.json.jb"
    # else
    #   render json: [], status: :unauthorized
    # end
  end

  def show
    @order = Order.find_by(id: params[:id])

    if @order.user_id == current_user.id
      render "show.json.jb"
    else
      render json: { message: "NO." }
    end
  end
end
