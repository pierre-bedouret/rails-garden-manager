class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :update, :destroy]

  def index
    @plants = Plant.all
  end

  def show
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new(plant_params)
    @plant.garden = @garden
    if @plant.save
      respond_to do |format|
        format.html { redirect_to garden_path(@garden) }
        format.js # <-- will render `app/views/plants/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'gardens/show' }
        format.js # <-- idem
      end
    end
  end

  def update
    if @plant.update(plant_params)
      respond_to do |format|
        format.html { redirect_to plant_path(@plant) }
        format.js { redirect_to plant_path(@plant) }
      end
    else
      respond_to do |format|
        format.html { render :show }
        format.js { render :show }
      end
    end
  end

  def destroy
    @garden = @plant.garden
    @plant.destroy
    respond_to do |format|
      format.html { redirect_to garden_path(@garden) }
      format.js # <-- render destroy.js.erb
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url, :category, :area, :fruit, :flower_color, :max_size, :lifetime)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end
