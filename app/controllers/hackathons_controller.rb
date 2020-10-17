class HackathonsController < ApplicationController

  def index
    @hackathons = Hackathon.all
  end

  def show
    @hackathon = Hackathon.find(params[:id])
    @reviews = @hackathon.reviews.all
  end

  def new
    @hackathon = Hackathon.new
  end

  def create
    @hackathon = Hackathon.new(hackathon_params)
    if @hackathon.save
      flash[:success] = "新しいハッカソンを作成しました"
      redirect_to root_url
    else
      render 'hackathons/new'
    end
  end

  def edit
    @hackathon = Hackathon.find(params[:id])
  end

  def update
    @hackathon = Hackathon.find(params[:id])
    if @hackathon.update(hackathon_params)
      flash[:success] = "ハッカソンを更新しました"
      redirect_to hackathon_url(@hackathon.id)
    else
      render 'hackathons/edit'
    end
  end

  def destroy
    Hackathon.find(params[:id]).destroy
    flash[:success] = "ハッカソンを削除しました"
    redirect_to root_url
  end

  private
    def hackathon_params
      params.require(:hackathon).permit(:name, :description, :url, :holding_time)
    end
end
