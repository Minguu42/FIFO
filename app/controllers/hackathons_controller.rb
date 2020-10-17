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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
