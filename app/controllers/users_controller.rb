class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
        if params[:term].present?
     @users = User.search(params[:term])
   else
     @users = User.all
   end
    @categories = Category.where(user_id: @user.id)
    @places = Place.where(user_id: @user.id)
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
