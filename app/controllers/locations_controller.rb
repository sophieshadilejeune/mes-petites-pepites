class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params_location)
    @location.user_id = current_user.id
    if @location.save
      redirect_to dashboard_path(@location.city_id)
    else
      render :new
    end
  end

  private

  def params_location
    params.require(:location).permit(:city_id, :user_id)
  end
end
