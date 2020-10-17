class HackathonsController < ApplicationController

  def index
    @hackathons = Hackathon.all
  end

  def show
    @hackathon = Hackathon.find(params[:id])
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
  end

  def update
  end

  def destroy
  end

  private
    def hackathon_params
      params.require(:hackathon).permit(:name, :description, :url, :holding_time)
    end
end
