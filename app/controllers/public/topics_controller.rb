class Public::TopicsController < ApplicationController
    def index
        @topics = Topic.all
        @columns = Column.where(is_public: true)
    end
end
