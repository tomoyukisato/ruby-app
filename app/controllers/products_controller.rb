class ProductsController < ApplicationController
    before_action :authenticate_user!
    def index
        @user = current_user.id
        @categories = Category.all
        @products = Product.search(params[:search])
    end
    def new 
        @product = Product.new 
    end
    def create
        post = Product.save( product_param,params[:upload] )
    end 
    
    
    def edit
        @product = Product.find(params[:id])
    end
    def update
        product = Product.find(params[:id])
        product.update(product_param)
    end
    def destroy
        product = Product.find(params[:id])
        product.destroy
    end
    def show
        @product = Product.find(params[:id])
        @comments = @product.comments
        @comment = Comment.new
    end
    # def product_params
    #     params.require(:product).permit()
    # end
    private 
    def product_param
        params.require(:product).permit(:name, :pic, :description, :category_id)
    end
    
end
