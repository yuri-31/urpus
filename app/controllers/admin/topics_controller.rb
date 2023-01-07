class Admin::TopicsController < ApplicationController
    
    def create
        @topic = Topic.new(topic_params)
        @topic.admin_id = current_admin.id
        if @topic.save
            flash[:success] = "You have successfully created TOPIC."
            redirect_to request.referer
        else
            flash[:danger] = "You failed to create new TOPIC."
            redirect_to request.referer
        end
    end
    
    def edit
        @topics = Topic.all
    end
    
    def update
        topic = Topic.find(params[:id])
        if topic.update(topic_params)
            @topics = Topic.all
            flash.now[:success] = "You have successfully updated TOPIC."
            render :edit
        else
            @topics = Topic.all
            flash.now[:danger] = "You failed to update TOPIC."
            render :edit
            # redirect_to template: "admin/columns/edit", locals:{id: params[:id]}
        end
    end
    
    def destroy
        topic = Topic.find(params[:id])
        if topic.destroy
            flash[:notice] = "The TOPIC has been deleted."
            @topics = Topic.all
            render :edit
        end
    end
    
    private
    def topic_params
        params.require(:topic).permit(:name)
    end
end
