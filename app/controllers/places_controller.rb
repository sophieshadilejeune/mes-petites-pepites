class PlacesController < ApplicationController
  before_action :set_place, only: %i[show edit update destroy]

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params_place)
    @place.user_id = current_user.id
    if @place.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @place.update(params_place)
    redirect_to place_path(@place)
  end

  def destroy
    @place.destroy
    redirect_to dashboard_path
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def params_place
    params.require(:place).permit(:name, :description, :address, :category_id)
  end
end
