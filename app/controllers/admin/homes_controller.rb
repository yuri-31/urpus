class Admin::HomesController < ApplicationController
    def top
        @topics = current_admin.topics
        @columns = Column.all
    end
end
