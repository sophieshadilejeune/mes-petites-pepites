class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def try

  end

  def home
    @user = current_user
    @cities = City.all
    if params[:term].present?
     @users = User.search(params[:term])
   else
     @users = User.all
   end
  end

  def dashboard
    # @categories = Category.where(user_id: nil).or(Category.where(user_id: current_user.id))
    # @categories = Category.where(user_id: current_user.id)
    # # @places = Place.where(user_id: nil).or(Place.where(user_id: current_user.id))
    # @places = Place.where(user_id: current_user.id)

    @user = current_user
    @cities = @user.cities
    @city = City.friendly.find(params[:id])
    @places = @city.places
    categories = []
    @places.each do |place|
      categories << place.category
    end
    @categories = categories.uniq
    @my_places = Place.where(city_id: @city.id, user_id: current_user.id)
    @places_geo = @places.where.not(latitude: nil, longitude: nil)
    @markers = @places_geo.map do |place|
      {
        category: place.category.name,
        owner: place.user_id,
        lat: place.latitude,
        lng: place.longitude,
        infowindow: render_to_string(partial: "infowindow", locals: { place: place })
      }
    end
    @my_places_geo = @my_places.where.not(latitude: nil, longitude: nil)
    @my_markers = @my_places_geo.map do |place|
      {
        category: place.category.name,
        lat: place.latitude,
        lng: place.longitude,
        infowindow: render_to_string(partial: "infowindow", locals: { place: place })
      }
    end
  end


end
