class Admin::HomesController < ApplicationController
    before_action :authenticate_admin!
    
    def top
        @topics = Topic.all
        
        if params[:topic_id]
            @topic = Topic.find(params[:topic_id])
            @columns = @topic.columns.reverse_order
        else
            @columns = Column.all.reverse_order
        end
    end
end
