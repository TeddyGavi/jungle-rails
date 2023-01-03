class Admin::SalesController < Admin::BaseController
  
  def index
    @sales = Sale.order(starts_on: :desc).all
  end
  
  def new
    @sales = Sale.new
  end

end
