require 'pry'
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    # @categories = Category.where(user_id: current_user.id)
    @categories = Category.where(user_id: nil).or(Category.where(user_id: current_user.id))
    @places = Place.where(user_id: nil).or(Place.where(user_id: current_user.id))
    @places_geo = @places.where.not(latitude: nil, longitude: nil)
    @markers = @places_geo.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infowindow: render_to_string(partial: "infowindow", locals: { place: place })
      }
    end
  end
end
