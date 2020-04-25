class ReviewsController < ApplicationController

  def new
  @place = Place.find(params[:place_id])
  @review = Review.new
  end

  def create
  @review = Review.new(review_params)
  @place = Place.find(params[:place_id])
  @review.user_id = current_user.id

  @review.place = @place
  if @review.save
    redirect_to place_path(@place)
  else
    render :new
  end
  end

  def index
  end

  def destroy
  end

private

def review_params
  params.require(:review).permit(:content, :place, :rating)
  end
end
