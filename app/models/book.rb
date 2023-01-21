class Book < ApplicationRecord
    
    belongs_to :user
    has_many :pages, dependent: :destroy
    
    validates :user_id, presence: true
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
    validates :is_private, inclusion: {in: [true, false]}
end
