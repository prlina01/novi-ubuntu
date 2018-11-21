class Api::V1::ReviewsController < ApplicationController
  before_action :load_book, only: :index
  before_action :load_review, only: [:show, :update, :destroy]
  before_action :authenticate_with_token!, only: :create
  def index
    @reviews = @book.reviews
    reviews_serializer = parse_json @reviews
    json_response "Index reviews sucessfully", true, {reviews: reviews_serializer}, :ok
  end

  def show
    reviews_serializer = parse_json @review
    json_response "Review loaded sucessfully", true, {review: reviews_serializer}, :ok
  end

  def create
    review = Review.new review_params
    review.user_id = current_user.id
    review.book_id = params[:book_id]
    if review.save
      reviews_serializer = parse_json @review
      json_response "Created review successfully", true, {review: reviews_serializer}, :ok
    else
      json_response "Failed creating fail", false, {}, :unproccessable_entity
    end
  end

  def update
    if correct_user @review.user
      if @review.update review_params
        reviews_serializer = parse_json @review
        json_response "Updated review successfully", true, {review: reviews_serializer}, :ok
      else
        json_response "Updated review fail", false, {}, :unproccessable_entity
      end
    else
      json_response "You don't have perms", false, {}, :unathorized
    end
  end

  def destroy
    if correct_user @review.user
      if @review.destroy
        json_response "Deletion of the review has been done successfully", true, {}, :ok
      else
        json_response "Deletion of the review failed", false, {}, :unproccessable_entity
      end
    else
      json_response "You don't have perms", false, {}, :unathorized      
    end
  end

  private
  def load_book
    @book = Book.find(params[:book_id])
    unless @book.present?
      json_response "Cannot find a book", false, {}, :not_found
  end
end

  def load_review
    @review = Review.find(params[:id])
    unless @preview.present?
      json_response "Cannot find a review", false, {}, :not_found
  end
end

  def review_params
    params.require(:review).permit :title, :content_rating, :recomment_rating
  end
end