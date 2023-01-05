class Public::UsersController < ApplicationController
    
    def show
        @user = current_user
    end
    
    def edit
        @user = current_user
    end
    
    def update
        @user = current_user
        if @user.update(user_params)
            flash[:success] = "Profile info has been updated successfully."
            redirect_to my_page_path
        else
            render :edit
        end
    end
    
    def unsubscribe
    end
    
    def withdraw
        @user = current_user
        @user.update(is_deleted: true)
        redirect_to destroy_user_session_path
    end
    
    
    private
    def user_params
        params.require(:user).permit(:nickname, :login_id, :email, :profile_image, :note)
    end
end
