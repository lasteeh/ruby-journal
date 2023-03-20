class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            redirect_to categories_path, notice: 'cat created'
        else
            render :new, notice: 'error', status: :unprocessable_entity
        end
    end

    def show
    end

    def edit
    end

    def update
        if @category.update(category_params)
            redirect_to categories_path, notice: 'cat updated'
        else
            render :edit, notice: 'error', status: :unprocessable_entity
        end
    end

    def destroy
        @category.destroy
        redirect_to categories_path, notice: 'cat destroyed'
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name, :description)
    end
end