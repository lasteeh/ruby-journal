class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]

    def index
        @categories = current_user.categories
        @tasks = current_user.tasks
        @solo_tasks = Task.left_outer_joins(:task_categories).where(task_categories: { id: nil })
    end

    def show
    end

    def new
        @task = Task.new
    end

    def create 
        @task = current_user.tasks.build(task_params)

        if @task.save
            if task_category_params[:category_ids]
                task_category_params[:category_ids].each do |category_id|
                    if category_id != ""
                        @task_category = TaskCategory.new(task_id: @task.id, category_id: category_id)
                        @task_category.save
                    end
                end
            end
            redirect_to tasks_path, notice: 'task created'
        else
            
            respond_to do |format|
                format.html {render :new, flash:{error:'inval'}, status: :unprocessable_entity}
                format.turbo_stream do
                    flash.now[:error] = @task.errors.full_messages
                    render turbo_stream:
                    turbo_stream.update('paperform', partial: "tasks/paperform", locals: {task: @task})
                end
            end
        end
    end

    def edit
    end

    def update
        if @task.update(task_params)
            redirect_to tasks_path, notice: 'task updated'
        else
            render :edit, notice: 'fail', status: :unprocessable_entity
        end
        
    end
    
    def destroy
        @task.destroy
        redirect_to tasks_path, notice: 'task destroyed'
    end

    def complete
        @task.toggle(:completed)
        @task.save
        redirect_to request.referrer, notice: 'task completed'
    end

    private

    def set_task
        @task = current_user.tasks.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:description, :deadline, :completed)
    end

    def task_category_params
        params.require(:task).permit(category_ids: [])
    end

end