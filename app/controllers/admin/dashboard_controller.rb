class Admin::DashboardController < Admin::BaseController

  def show
    @product_count = Product.count
    @cat_count = Category.count
    @product_by_cat = Category.joins(:products).group(:name).count
  end
end
