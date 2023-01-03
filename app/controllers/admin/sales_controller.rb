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
      redirect_to [:admin, :sales], notice: "Sale created"
    else
      render :new
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    if @sale.destroy
      redirect_to [:admin, :sales], notice: "Sale deleted"
    else
      redirect_to [:admin, :sales], notice: "Sale could not be deleted when active"
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
