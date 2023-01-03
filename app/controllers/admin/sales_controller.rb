class Admin::SalesController < Admin::BaseController
  
  def index
    @sales = Sale.order(starts_on: :desc).all
  end
  
  def new
    @sales = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to [:admin, :sales], notice: "Sale created"
    else
      render :new
    end
  end

  private

  def sale_params
    params.require(:sale).permit(
      :name,
      :percent_off,
      :starts_on,
      :ends_on,
    )
  end
end
