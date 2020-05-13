class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    if @category.save
      redirect_to manage_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @category.update(params_category)
    redirect_to manage_categories_path
  end

  def destroy
    @category.destroy
    redirect_to manage_categories_path
  end

  def manage
    @categories = Category.all
    @category = Category.new
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def params_category
    params.require(:category).permit(:name)
  end
end
