class GardensController < ApplicationController
  def index
    @gardens = Garden.all
    @garden = Garden.new
  end

  def show
    @garden = Garden.find(params[:id])
    @plant = Plant.new
    @plants = @garden.plants
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to garden_path(@garden)
    else
      @gardens = Garden.all
      render :index
    end
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :banner_url)
  end
end
