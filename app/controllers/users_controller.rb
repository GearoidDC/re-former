class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        #@user = User.new(username: params[:username], email: params[:email], password_digest: params[:password_digest])
        @user = User.new(user_params)
        if @user.save
            redirect_to new_user_path
        else
            render :new
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.username = user_params[:username]
        @user.email = user_params[:email]
        @user.password_digest = user_params[:password_digest]
    
        if @user.save
          redirect_to new_user_path
        else
          render :edit
        end    
    end
    
    
    def user_params
        params.require(:user).permit(:username,:email,:password_digest)
    end
end
