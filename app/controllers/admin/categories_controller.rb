class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:Notice] = 'Category was successfully created'
      redirect_to [:admin, :categories]
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    render :edit
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:Notice] = "Category updated!"
      redirect_to [:admin, :categories]
    else
      flash[:Alert] = "Category update failed!"
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
      if @category.destroy
        flash[:Notice] = "Category deleted!"
        redirect_to [:admin, :categories]
      else
        flash[:Error] = "Cannot delete a category that contains products."
        redirect_to [:admin, :categories]
        
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
