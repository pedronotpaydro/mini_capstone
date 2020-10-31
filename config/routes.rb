Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products" => "products#all_products_action"

    get "/first_product" => "products#first_product_action"

    get "/query_path" => "products#query_path_action"

    get "/segment_path/:name" => "products#query_path_action"
  end
end
