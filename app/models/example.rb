class Example < ApplicationRecord
    belongs_to :word
    
    validates :word_id, presence: true
    validates :sentence, presence: true
end
