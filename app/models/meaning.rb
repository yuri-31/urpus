class Meaning < ApplicationRecord
    
    belongs_to :word
    
    validates :word_id, presence: true
    validates :content, presence: true
end
