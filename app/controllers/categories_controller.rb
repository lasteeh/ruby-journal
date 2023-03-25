class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = current_user.categories
    end

    def new
        @category = Category.new
    end

    def create
        @category = current_user.categories.build(category_params)

        respond_to do |format|
        if @category.save
            format.turbo_stream do
                render turbo_stream:
                turbo_stream.prepend('stickycat', partial: "categories/stickycat", locals: {category: current_user.categories.build(category_params)})
            end
            format.html {redirect_to categories_path, notice: 'cat created'}
        else
            format.turbo_stream do
                render turbo_stream:
                turbo_stream.update('stickyform', partial: "categories/stickyform", locals: {category: current_user.categories.build(category_params)})
            end
            format.html {render :new, notice: 'error', status: :unprocessable_entity}
        end
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
        @category = current_user.categories.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name, :description)
        # params.permit(:name, :description)
    end
end