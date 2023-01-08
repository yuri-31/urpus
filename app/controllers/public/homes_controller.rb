class Public::HomesController < ApplicationController
    
    def top
        if user_signed_in?
         @words = current_user.words
        end
    end
    
    def about
    end
end
