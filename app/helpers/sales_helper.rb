module SalesHelper

  def active_sale?
    if Sale.active.any?
      @sale = Sale.active
      # raise @sale.inspect
    end
  end
  
end