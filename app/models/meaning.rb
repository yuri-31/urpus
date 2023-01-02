class Meaning < ApplicationRecord
    
    belongs_to :word
    
    # validates :id, presence: true
    validates :content, presence: true
end
