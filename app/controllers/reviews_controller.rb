class ReviewsController < ApplicationController

  def create
    # raise @current_user.inspect
    # raise params[:product].inspect
    # puts params[:product_id]
    # puts params[:review]
    puts "look here!!!"
    puts review_params
    authorize
    @current_user = current_user
    @product = Product.find(params[:product_id])
    # @product = Review.has_many(:products)
    # raise @product.inspect
    @new_review = Review.new({
        product: @product, 
        user: @current_user,
        description: params[:description],
        rating: params[:rating],
      })

    if @new_review.save
      flash[:Notice] = "Review successfully created!"
      redirect_to 'products'
    else
      flash[:Error] = "Review submission failed"
      redirect_to products_path(params[:product_id])
    end


  end


  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :description,
      :rating, 
  )
  end
end
