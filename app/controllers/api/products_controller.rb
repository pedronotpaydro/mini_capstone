class Api::ProductsController < ApplicationController
  def all_products_action
    @products = Product.all
    render "all.json.jb"
  end

  def first_product_action
    @first = Product.first
    render "first.json.jb"
  end

  def query_path_action
    input_value = params["name"]
    @output_value = Product.find_by name: "#{input_value}"
    render "query.json.jb"
  end
end
