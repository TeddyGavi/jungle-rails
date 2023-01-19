class ReviewsController < ApplicationController
  before_action :authorize
  def create
    puts params[:product_id]
    puts "look here!!!"
    @current_user = current_user
    @product = Product.find(params[:product_id])
    @new_review = Review.new(review_params)
    @new_review.product = @product
    @new_review.user = @current_user
    
    if @new_review.save
      flash[:Notice] = "Review successfully created!"
      redirect_to product_path(@product)
    else
      flash[:Error] = "Review submission failed"
      redirect_back fallback_location: products_path
    end
  end

  def destroy
    @review_del = Review.find(params[:product_id])
    @review_del.destroy
  flash[:Notice] = "Review successfully deleted!"
    redirect_back fallback_location: products_path
  end


  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating, 
  )
  end
end
