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
    end
    
    
    private
    def column_params
        params.require(:column).permit(:title, :topic_id, :article, :writer, :is_public)
    end
end
