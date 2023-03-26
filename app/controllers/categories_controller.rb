class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy, :favorite]

    def index
        @categories = current_user.categories
    end

    def new
        @category = Category.new
    end

    def create
        @category = current_user.categories.build(category_params)

        
            if @category.save
                redirect_to categories_path, notice: 'Category successfully created'
                # format.html {redirect_to categories_path, notice: 'cat created'}
                # format.turbo_stream do
                #     render turbo_stream: [
                #     turbo_stream.append('stickycategories', partial: "categories/stickycategories", locals: {category: @category}),
                #     turbo_stream.update('stickyform', partial: "categories/stickyform", locals: {category: @category})
                #     ]
                # end
            else
                # binding.break
                respond_to do |format|
                    format.html {render :new, flash:{error:'inval'}, status: :unprocessable_entity}
                    format.turbo_stream do
                        flash.now[:error] = @category.errors.full_messages
                        render turbo_stream:
                        turbo_stream.update('stickyform', partial: "categories/stickyform", locals: {category: @category})
                    end
                end
            end
       
    end

    def show
        # binding.break
        @tasks = @category.tasks.order(completed: :asc, deadline: :asc)
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
        redirect_to categories_path, flash: {error: 'cat destroyed'}
    end

    def favorite
        @category.toggle(:favorite)
        @category.save
        redirect_to category_show_path, notice: 'added to favorite'
    end

    private

    def set_category
        @category = current_user.categories.find(params[:id])
        # @category = current_user.categories.find_by(name: params[:name])
    end

    def category_params
        params.require(:category).permit(:name, :description)
        # params.permit(:name, :description)
    end
end