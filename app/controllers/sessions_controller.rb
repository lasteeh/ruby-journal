class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if user = User.login(login_params)
            redirect_to categories_path
        else
            render :new, notice: 'fail login', status: :unprocessable_entity
        end
    end

    def destroy

    end

    private

    def login_params
        params.require(:user).permit(:username, :email, :password)
    end

end