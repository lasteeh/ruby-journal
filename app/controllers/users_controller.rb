class UsersController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        return redirect_to app_path if logged_in?
        @user = User.new
    end

    def create
        # debugger
        @user = User.new(user_params)
        if signup_params[:password].blank? || signup_params[:password].length < 8
            @user = User.create(user_params)
            render :new, status: :unprocessable_entity
        elsif signup_params[:password] != signup_params[:password_confirmation]
            @user.errors.add(:password_confirmation, 'doesnt match with Password')
            render :new, status: :unprocessable_entity
        else
            @user = User.signup(user_params)

            if @user.save
                redirect_to login_path, notice: 'Account successfully created'
            else
                render :new, status: :unprocessable_entity
            end
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_show_url, notice: 'update done'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        # @user.destroy
        # redirect_to root_url
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def signup_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def set_profile
        @user = User.find(current_user.id)
    end

end