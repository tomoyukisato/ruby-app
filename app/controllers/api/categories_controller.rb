class Api::CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    logger.debug("コントローラーでデバッグだよ")
    logger.debug(@category.name)
    
    @products = Product.where(category_id: params[:id])
    logger.debug(@products)
  end
end
