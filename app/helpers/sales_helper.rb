module SalesHelper

  def active_sale?
    if Sale.active.any?
      @sale = Sale.active
    end
  end
  
end