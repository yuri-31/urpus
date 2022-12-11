class Admin::TopicsController < ApplicationController
    
    def index
        @topic = Topic.new
        @topics = current_admin.topics
    end
    
    def create
        @topic = Topic.new(topic_params)
        @topic.admin_id = current_admin.id
        @topic.save
        redirect_to request.referer
    end
    
    
    private
    def topic_params
        params.require(:topic).permit(:name)
    end
end
