class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
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

  # def image
  #   Image.where(product_id: id)
  # end

  # def supplier
  #   Supplier.where(id: supplier_id)
  # end
end
