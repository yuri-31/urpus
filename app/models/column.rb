class Column < ApplicationRecord
    
    belongs_to :topic
    
    validates :topic_id, presence: true
    validates :title, presence: true
    validates :article, presence: true
    validates :writer, presence: true
    validates :is_public, inclusion: {in: [true, false]}
end
