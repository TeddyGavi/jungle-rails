class Admin::DashboardController < Admin::BaseController

  def show
    @product_count = Product.count
    @cat_count = Category.count
    @cat = Category.all
  end
end
