class PlacesController < ApplicationController
  before_action :set_place, only: %i[show edit update destroy]

  def show
  @review = Review.new
  @reviews = @place.reviews
  @rating_sum = 0
  @reviews.each do |review|
    @rating_sum += review.rating
    end
  @average = @rating_sum / @reviews.count
  @place_geo = []
  @place_geo << @place
    @markers = @place_geo.map do |place|
      {
        category: place.category.name,
        lat: place.latitude,
        lng: place.longitude,
        infowindow: render_to_string(partial: "infowindow", locals: { place: place })
      }
    end
    def blank_stars
      5 - rating.to_i
    end
  end

  def new
  @city = City.friendly.find(params[:city_id])
  @place = Place.new
  end

  def create
    @place = Place.new(params_place)
    @place.city = City.friendly.find(params[:city_id])
    @place.user_id = current_user.id
    if @place.save
      redirect_to dashboard_path(@place.city)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @place.update(params_place)
    redirect_to dashboard_path(@place.city)
  end

  def destroy
    @place.destroy
    redirect_to dashboard_path(@place.city)
  end

  private

  def set_place
    @place = Place.friendly.find(params[:id])
  end

  def params_place
    params.require(:place).permit(:name, :description, :address, :category_id, :city_id)
  end
end
