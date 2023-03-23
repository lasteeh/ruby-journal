class SessionsController < ApplicationController

    def new
        return redirect_to app_path if logged_in?
        @user = User.new
    end

    def create
        
        if user = User.login(login_params)
            session[:user_token] = user.token
            respond_to do |format|
                format.html { redirect_to app_path }
                format.json { render json: { token: user.token }, status: :ok }
            end
        else
            render json: { error: 'invalid email/password' }, status: :unauthorized
        end
    end

    def destroy
        session[:user_token] = nil
        redirect_to root_url, notice: 'logged outtt'
    end

    private

    def login_params
        params.require(:user).permit(:username, :email, :password)
    end

end