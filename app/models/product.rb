class Product < ApplicationRecord

  belongs_to :supplier

  has_many :images

  def supplier_name
    supplier.name
  end

  validates :name, :price, :description, presence: true
  validates :name, uniqueness: true
  validates :price, :quantity, numericality: {greater_than: 0}
  validates :description, length: {maximum: 700}


  def is_discounted?
    price < 20
  end

  def tax
    price*0.09
  end

  def total
    price + tax
  end

end
