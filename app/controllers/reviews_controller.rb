class ReviewsController < ApplicationController
  before_action :review_params, only: [:create]

  def create
    @review = Review.create(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = Review.where("restaurant_id = #{@restaurant.id}")
    @restaurant.reviews << @review

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render "restaurants/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
