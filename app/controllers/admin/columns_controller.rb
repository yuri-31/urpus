class Admin::ColumnsController < ApplicationController
    def new
        @column = Column.new
        @topics = current_admin.topics
        @topic = Topic.new
    end
    
    def create
        @column = Column.new(column_params)
        @column.save
        redirect_to edit_admin_column_path(@column.id)
    end
    
    def edit
        @column = Column.find(params[:id])
        @topic = Topic.new
        @topics = Topic.all
    end
    
    def update
        @column = Column.find(params[:id])
        @column.update(column_params)
        redirect_to admin_top_path
    end
    
    def destroy
        @column = Column.find(params[:id])
        @column.destroy
        redirect_to admin_top_path
    end
    
    def update_status
        column = Column.find(params[:id])
        column.update(column_status_params)
        redirect_to request.referer
    end
    
    private
    def column_params
        params.require(:column).permit(:title, :topic_id, :article, :writer, :is_public)
    end
    def column_status_params
        params.require(:column).permit(:is_public)
    end
end
