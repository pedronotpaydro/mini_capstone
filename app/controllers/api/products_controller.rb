class Api::ProductsController < ApplicationController
  def all_products_action
    @products = Product.all
    render "all.json.jb"
  end
  
  def first_product_action
    @first = Product.first
    render "first.json.jb"
end
