class Api::ProductsController < ApplicationController
    def show
        @product = Product.find(params[:id])
        # render 'show', formats; 'json', handlers: 'jbuilder'
        render 'show', formats: :json, handlers: 'jbuilder'
    end
end
