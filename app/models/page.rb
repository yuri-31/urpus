class Page < ApplicationRecord
    
    has_many :words, dependent: :destroy
    belongs_to :book
    
    validates :book_id, presence: true
    validates :name, presence: true, format: { with: /\A[a-zA-Z0-9\s!"#$%&'()=~^|@`{};:+*,.<>?_]+\z/ }
end
