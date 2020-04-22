class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @categories = Category.all
    @places = Place.all
    @places_geo = Place.where.not(latitude: nil, longitude: nil)
    @markers = @places_geo.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infowindow: render_to_string(partial: "infowindow", locals: { place: place })
      }
    end
  end
end
