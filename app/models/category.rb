class Category < ApplicationRecord

  has_many :products

  validates :name, presence: true

  before_destroy :has_products, prepend: true

  def has_products
    if self.products.count >= 1
      self.errors.add(:product, "Cannot delete a category that contains products, considering renaming?") 
      throw :abort
    end
  
  end
end
