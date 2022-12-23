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
      # flash[:alert] = "Category updated!"
      # redirect_to [:admin, :categories]
      redirect_to [:admin, :categories]
    else
      # flash[:alert] = "Category update failed!"
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    # respond_to do |format| 
      if @category.destroy
      #  format.html { redirect_to [:admin, :categories], notice: 'Category deleted successfully'}
        # format.json { render json: [:admin, :categories], status: :deleted, location: @category}
        redirect_to [:admin, :categories], notice: 'Category deleted'
      else
          # format.html {render :index, status: :unprocessable_entity }
        # format.json {render json: @category.errors, status: :unprocessable_entity}
        redirect_to [:admin, :categories], notice: 'Category delete failed!'
        
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
