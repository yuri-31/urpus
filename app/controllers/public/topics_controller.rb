class Public::TopicsController < ApplicationController
    def index
        @topics = Topic.all
        
        if params[:topic_id]
            @topic = Topic.find(params[:topic_id])
            @columns = @topic.columns.where(is_public: true).reverse_order
        else
            @columns = Column.where(is_public: true)
        end
    end
end
