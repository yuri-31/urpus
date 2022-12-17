class Page < ApplicationRecord
    
    has_many :words, dependent: :destroy
end
