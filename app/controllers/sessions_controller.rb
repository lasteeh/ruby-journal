class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.login(login_params)
        if user
            session[:user_token] = user.token
            render json: { msessage: 'login success', token: user.token }, status: 200
        else
            render json: { error: 'invalid email/password' }, status: 401
        end
    end

    def destroy
        session[:user_token] = nil
        redirect_to tasks_path, notice: 'logged outtt'
    end

    private

    def login_params
        params.require(:user).permit(:username, :email, :password)
    end

end