class Page < ApplicationRecord
    
    has_many :words, dependent: :destroy
    
    validates :book_id, presence: true
    validates :name, presence: true
end
