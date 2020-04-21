class PlacesController < ApplicationController
  before_action :set_place, only: %i[show edit update destroy]
  def index
    @places = Place.all
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params_place)
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @place = Place.update(params_flat)
    redirect_to place_path(@place)
  end

  def destroy
    @place.destroy
    redirect_to places_path
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def params_place
    params.require(:place).permit(:name, :description, :address)
  end
end
