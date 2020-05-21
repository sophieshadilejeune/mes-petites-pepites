class CitiesController < ApplicationController
   skip_before_action :authenticate_user!, only: [:new, :create, :show]

  # def index
  #   @user = current_user
  #   @cities = @user.cities
  #   @city = @user.cities.first
  #   @categories = Category.where(city_id: @city.id)
  #   @places = @city.places
  #   @my_places = Place.where(city_id: @city.id, user_id: current_user.id)
  # end

  def new
    @city = City.new
  end

  def create
    @city = City.new(params_city)
    if @city.save
      @location = Location.new(user_id: current_user.id, city_id: @city.id)
      if @location.save
        redirect_to dashboard_path(@city)
      else
        render :new
      end
    else
      render :new
    end
  end

  # def select
  #   @user = current_user
  #   @location = Location.new(user_id: @user.id, city_id: :city_ids)
  # end

  def show
    @user = current_user
    @cities = City.all
    @city = City.friendly.find(params[:id])
    @places = @city.places
    categories = []
    @places.each do |place|
      categories << place.category
    end
    @categories = categories.uniq
    @places_geo = @places.where.not(latitude: nil, longitude: nil)
    @markers = @places_geo.map do |place|
      {
        category: place.category.name,
        owner: place.user_id,
        lat: place.latitude,
        lng: place.longitude,
        infowindow: render_to_string(partial: "./places/infowindow", locals: { place: place })
      }
    end
  end

  # def visitor
  #   @user = current_user
  #   @cities = City.all
  #   @city = City.find(params[:id])
  #   @categories = Category.where(city_id: @city.id)
  #   @places = @city.places
  #   @places_geo = @places.where.not(latitude: nil, longitude: nil)
  #   @markers = @places_geo.map do |place|
  #     {
  #       category: place.category.name,
  #       owner: place.user_id,
  #       lat: place.latitude,
  #       lng: place.longitude,
  #       infowindow: render_to_string(partial: "infowindow", locals: { place: place })
  #     }
  #   end
  # end



  def edit
  end

  def update
  end

  def destroy
  end

private
  def params_city
    params.require(:city).permit(:name)
  end
end
