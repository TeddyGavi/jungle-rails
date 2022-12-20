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
      redirect_to [:admin, :categories], notice: 'Category created!'
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
      flash[:notice] = "Category updated!"
      redirect_to [:admin, :categories]
    else
      flash[:error] = "Category update failed!"
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted'
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
