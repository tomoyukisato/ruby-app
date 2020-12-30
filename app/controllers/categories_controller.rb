class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destory]
  def index
    @category = Category.new
    @categories = Category.all
  end
  def create
    @category = Category.new(category_params)
    
    if @category.save
      redirect_to categories_path
    else
      @categories = Category.all
      render 'index'
    end
  end

  def edit
    # @category = Category.find(params[:id]);
  end
  def update
    logger.debug("category_params")
    logger.debug(category_params)
    # @category = Category.find(params[:id]);
    if @category.update(category_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end
  def destory
    @category.destory
    redirect_to categories_path
  end 
  private 
    def set_category
      @category = Category.find(params[:id])
    end
    def category_params
      params.require(:category).permit(:name)
    end
end
