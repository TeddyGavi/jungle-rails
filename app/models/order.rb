class Order < ApplicationRecord
  
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  # def send_order_reciept
  #   RecieptMailer.send_order_reciept
  # end

end
