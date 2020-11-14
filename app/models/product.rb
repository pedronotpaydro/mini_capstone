class Product < ApplicationRecord
  belongs_to :supplier
  has_many :orders
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :user, through: :carted_products
  has_many :orders, through: :carted_products

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: 5..500 }

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  # def categories
  #   category_products.map do |category_product|
  #     category_product.category_id
  #   end
  # end

  # def image
  #   Image.where(product_id: id)
  # end

  # def supplier
  #   Supplier.where(id: supplier_id)
  # end
end
