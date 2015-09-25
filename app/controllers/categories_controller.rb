class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Your category has been created'
      redirect_to root_path
    else 
      flash[:error] = 'Your category failed to save. Please try again'
      render :new
    end
  end

  def show 
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end 
end