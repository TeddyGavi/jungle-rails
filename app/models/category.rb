class Category < ApplicationRecord

  has_many :products

  validates :name, presence: true

  before_destroy :has_products, prepend: true

  def has_products
    if self.products.count >= 1
      throw :abort
    end
  
  end
end
