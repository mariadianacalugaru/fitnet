class ReviewsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!, except: [:index]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
			redirect_to reviews_path, notice: "Review successfully added." 
		else
			render :new, status: :unprocessable_entity 
    end
  end

  private
    def review_params
      params.require(:review).permit(:body)
    end
  

end
