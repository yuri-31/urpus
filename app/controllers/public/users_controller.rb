class Public::UsersController < ApplicationController
     before_action :ensure_normal_user, only: %i[update edit withdraw]
     before_action :authenticate_user!, except: [:show]

    def ensure_normal_user
      if current_user.email == 'guest@example.com'
        flash[:danger] = "Guest account cannot be deleted or updated."
        redirect_to my_page_path
      end
    end
    
    def my_page
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
            flash[:error] = @user.errors.full_messages
            redirect_to request.referer
        end
    end
    
    def unsubscribe
    end
    
    def withdraw
        @user = current_user
        @user.update(is_deleted: true)
        redirect_to destroy_user_session_path
    end
    
    def show
        @user = User.find(params[:id])
        
        if @user.is_deleted == true
            flash[:notice] = 'This user has been deleted.'
            redirect_to books_path
        end
    end
    
    
    private
    def user_params
        params.require(:user).permit(:nickname, :login_id, :email, :profile_image, :note)
    end
end
