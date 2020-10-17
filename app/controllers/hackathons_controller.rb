class HackathonsController < ApplicationController

  def index
    @hackathons = Hackathon.all
  end

  def show
    @hackathon = Hackathon.find(params[:id])
  end

  def new
  end

  def create
    @hackathon = Hackathon.new(hackathon_params)
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
