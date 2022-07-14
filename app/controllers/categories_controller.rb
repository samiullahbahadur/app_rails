class CategoriesController < ApplicationController
  def index

  end
  def new
    @category=Category.new
  end

  def create 
    @category =Category.new(category_params)
    if @category.save 

    else
      render 'new'
    end
  end

  private 
  def category_params 
    params.require.(:category).permit(:name)
  def show 
  end
end
