class CategoriesController < ApplicationController

    def show
        @category=Category.find(params[:id])
        @categories=Category.all
        @posts=@category.posts.includes(:user).page(params[:page])
    end

end
