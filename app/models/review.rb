class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates_inclusion_of :rating, :in => 1..5, presence: true

end
