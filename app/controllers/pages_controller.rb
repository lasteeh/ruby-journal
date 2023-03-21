class PagesController < ApplicationController

    def app

    end

    def home
        if logged_in?
            redirect_to app_path
        end
    end

end