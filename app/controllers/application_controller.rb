class ApplicationController < ActionController::Base

    def current_user
        @current_user ||= User.find_by(token: session[:user_token]) if session[:user_token]
    end

    def logged_in?
        !current_user.nil?
    end

end
