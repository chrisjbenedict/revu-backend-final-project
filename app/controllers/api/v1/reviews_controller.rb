class Api::V1::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    render json: @reviews
  end

  def show
    @review = Review.find(params[:id])
    render json: @review, status: :ok
  end

  def create
    @review = Review.create(review_params)
    render json: @review, status: :created
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    render json: @review, status: :accepted
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :college_id, :category_id, :content, :rating, :photo)
  end
end
