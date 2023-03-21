class ApplicationController < ActionController::Base

    before_action :require_login

    def current_user
        @current_user ||= User.find_by(token: session[:user_token]) if session[:user_token]
    end

    def logged_in?
        !current_user.nil?
    end

    private

    def require_login
        unless current_user || allowed_pages.include?(request.path)
            redirect_to root_path
          end
    end

    def allowed_pages
        [root_path, login_path, signup_path]
    end

end
