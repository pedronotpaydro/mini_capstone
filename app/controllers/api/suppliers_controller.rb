class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all

    # if params[:search]
    #   @suppliers = @suppliers.where("name LIKE ?", "%#{params[:search]}%")
    #   @suppliers.order(id: :asc)
    # elsif params[:sort] == "price" && params[:sort_order] == "desc"
    #   @suppliers = @suppliers.order(price: :desc)
    # elsif params[:sort] == "price"
    #   @suppliers = @suppliers.order(price: :asc)
    # elsif params[:sort] == ""
    #   @suppliers.order(id: :desc)
    # elsif params[:discount] == true
    #   @suppliers = @suppliers.where("is_discounted? LIKE ?", "#{params[discount]}")
    #   @suppliers.order(id: :desc)
    # else
    # end

    render "index.json.jb"
  end

  def show
    input_value = params["id"]
    @supplier = Supplier.find_by id: input_value
    render "show.json.jb"
  end

  def create
    @supplier = Product.new({
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"],

    })
    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    input_value = params["id"]
    @supplier = supplier.find_by id: input_value

    @supplier.name = params["name"] || @supplier.name
    @supplier.email = params["email"] || @supplier.email
    @supplier.phone_number = params["phone_number"] || @supplier.phone_number

    @supplier.save

    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    input_value = params["id"]
    @supplier = Supplier.find_by id: input_value

    @supplier.destroy
    render json: { message: "supplier DESTROYED!" }
  end
end
