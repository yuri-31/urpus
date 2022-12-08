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
            redirect_to my_page_path
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
        params.require(:user).permit(:nickname, :login_id, :email)
    end
end
