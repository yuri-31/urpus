class Meaning < ApplicationRecord
    
    belongs_to :word
    
    # validates :id, presence: true
    validates :content, presence: true, format: { with: /\A[a-zA-Z0-9\s!"#$%&'()=~^|@`{};:+*,.<>?_]+\z/ }
end
