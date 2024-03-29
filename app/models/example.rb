class Example < ApplicationRecord
    belongs_to :word
    
    # validates :word_id, presence: true
    validates :sentence, presence: true, format: { with: /\A[a-zA-Z0-9\s!"#$%&'()=~^|@`{};:+*,.<>?_]+\z/ }
end
