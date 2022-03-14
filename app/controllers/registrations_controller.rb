class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)   
        if @user.save 
            session[:user_id] = @user.id
            redirect_to root_path    
        else
            flash[:alert] = "Invalid name or password"
            render :new    
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :password)
    end
end


