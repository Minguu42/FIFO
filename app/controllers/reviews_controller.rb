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
    @review.image.attach(params[:review][:image])
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = 'レビューを作成しました。'
      redirect_to hackathon_path(@hackathon.id)
    else
      render 'reviews/new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = 'レビューを更新しました'
      redirect_to reviews_url
    else
      render 'reviews/edit'
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = 'レビューの削除に成功しました'
    redirect_to reviews_url
  end

  def like
    @review = Review.find(params[:id])
    num = @review.like_num + 1
    @review.update_attribute(:like_num, num)
    redirect_back(fallback_location: root_url)
  end

  private
    def review_params
      params.require(:review).permit(:title, :role, :level, :comment, :image)
    end
end
