class Admin::SalesController < Admin::BaseController
  
  def index
    @sales = Sale.order(starts_on: :desc).all
  end
  
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      flash[:Notice] = "Sale created" 
      redirect_to [:admin, :sales]
    else
      render :new
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    if @sale.destroy
      flash[:Notice] = "Sale deleted" 
      redirect_to [:admin, :sales]
    else
      flash[:Error] = "Sale count not be deleted"
      redirect_to [:admin, :sales]
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
