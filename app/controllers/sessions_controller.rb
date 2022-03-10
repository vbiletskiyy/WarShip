class SessionsController < ApplicationController
    def new
        if !logged_in?
            @user = User.new
        end
    end

    def create
        @user = User.find_by(name: login_params[:name])
        if @user && @user.authenticate(login_params[:password])
            session[:user_id] = @user.id 
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    private
    def login_params
        params.require(:user).permit(:name, :password)
    end

end
