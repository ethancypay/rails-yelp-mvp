class ReviewsController < ApplicationController
  before_action :review_params, only: [:create]

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.create(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = Review.where("restaurant_id = #{@restaurant.id}")
    @restaurant.reviews << @review

    if @review.save
      redirect_to restaurant_path(@restaurant)
    elsif params[:loc] == 'show'
      render "restaurants/show"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
