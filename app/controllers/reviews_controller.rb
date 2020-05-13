class ReviewsController < ApplicationController

  def new
  @place = Place.friendly.find(params[:place_id])
  @review = Review.new
  end

  def create
  @review = Review.new(review_params)
  @place = Place.friendly.find(params[:place_id])
  @review.user_id = current_user.id

  @review.place = @place
  if @review.save
    redirect_to city_place_path(@place.city, @place)
  else
    render :new
  end
  end


private

def review_params
  params.require(:review).permit(:content, :place_id, :rating)
  end
end
