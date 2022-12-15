class Admin::UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def update
        user = User.find(params[:id])
        user.update(user_params)
        redirect_to request.referer
    end
    
    private
    def user_params
        params.require(:user).permit(:is_deleted)
    end
end
