class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.friendly.find(params[:user_id])
    if params[:term].present?
      @users = User.search(params[:term])
    else
     @users = User.all
   end
   if @user.cities.count != 0
    @city = City.friendly.find(params[:id])
    @cities = @user.cities
    @places = @city.places.where(user_id: @user.id)
    categories = []
    @places.each do |place|
      categories << place.category
    end
    @categories = categories.uniq

    @places_geo = @places.where.not(latitude: nil, longitude: nil)
    @markers = @places_geo.map do |place|
      {
        category: place.category.name,
        lat: place.latitude,
        lng: place.longitude,
        infowindow: render_to_string(partial: "places/infowindow", locals: { place: place })
      }
    end
  end
end
end
