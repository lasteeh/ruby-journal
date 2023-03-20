class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]

    def index
        @tasks = Task.all
    end

    def show
    end

    def new
        @task = Task.new
    end

    def create 
        @task = Task.new(task_params)

        if @task.save
            redirect_to tasks_path, notice: 'task created'
        else
            render :new, notice: 'failed', status: :unprocessable_entity
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
        redirect_to task_show_path, notice: 'task completed'
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:description, :deadline)
    end

end