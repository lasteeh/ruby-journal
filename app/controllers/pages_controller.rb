class PagesController < ApplicationController

    def app
        @tasks = current_user.tasks.where('deadline >= ?', Date.today).order(deadline: :asc)


    end

    def home
        if logged_in?
            redirect_to app_path
        end
    end

end