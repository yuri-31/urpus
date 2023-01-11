class Admin::ColumnsController < ApplicationController
    before_action :authenticate_admin!
    
    def new
        @column = Column.new
        # (session[:column] || {})
        @topics = current_admin.topics
        @topic = Topic.new
    end
    
    def create
        @column = Column.new(column_params)
        if @column.save
            session[:column] = nil
            flash[:notice] = "You have created COLUMN successfully."
            redirect_to admin_top_path
        else
            # session[:column] = @column.attributes.slice(*column_params.keys)
            @topics = current_admin.topics
            @topic = Topic.new
            flash[:error] = @column.errors.full_messages
            redirect_to new_admin_column_path
        end
    end
    
    def edit
        @column = Column.find(params[:id])
        @topic = Topic.new
        @topics = Topic.all
    end
    
    def update
        @column = Column.find(params[:id])
        if @column.update(column_params)
            flash[:notice] = "Column updated successfully."
            redirect_to admin_top_path
        else
            @topic = Topic.new
            @topics = Topic.all
            flash[:error] = @column.errors.full_messages
            redirect_to request.referer
        end
    end
    
    def destroy
        @column = Column.find(params[:id])
        @column.destroy
        redirect_to admin_top_path
    end
    
    def update_status
        column = Column.find(params[:id])
        column.update(column_status_params)
        flash[:notice] = "Column status updated successfully."
        redirect_to admin_top_path
    end
    
    private
    def column_params
        params.require(:column).permit(:title, :topic_id, :article, :writer, :is_public)
    end
    def column_status_params
        params.require(:column).permit(:is_public)
    end
end
