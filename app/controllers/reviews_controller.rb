class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @reviews = @user.reviews
  end

  def new
    @hackathon = Hackathon.find(params[:hackathon_id])
    @review = @hackathon.reviews.build
  end

  def create
    @hackathon = Hackathon.find(params[:hackathon_id])
    @review = @hackathon.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = 'レビューを作成しました。'
      redirect_to hackathon_path(@hackathon.id)
    else
      render 'reviews/new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def review_params
      params.require(:review).permit(:title, :role, :level, :comment)
    end
end
