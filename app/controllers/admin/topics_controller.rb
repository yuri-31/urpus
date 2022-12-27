class Admin::TopicsController < ApplicationController
    
    def create
        @topic = Topic.new(topic_params)
        @topic.admin_id = current_admin.id
        @topic.save
        redirect_to request.referer
    end
    
    def edit
        @topics = Topic.all
    end
    
    def update
        topic = Topic.find(params[:id])
        topic.update(topic_params)
        redirect_to request.referer
    end
    
    def destroy
        topic = Topic.find(params[:id])
        topic.destroy
        redirect_to request.referer
    end
    
    private
    def topic_params
        params.require(:topic).permit(:name)
    end
end
