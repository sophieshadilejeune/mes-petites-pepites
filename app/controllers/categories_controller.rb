class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    @category.user_id = current_user.id
    if @category.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @places = Place.where(category: params[:id])
  end

  def edit
  end

  def update
    @category.update(params_category)
    redirect_to dashboard_path
  end

  def destroy
    @category.destroy
    redirect_to dashboard_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def params_category
    params.require(:category).permit(:name)
  end
end
