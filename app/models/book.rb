class Book < ApplicationRecord
    
    belongs_to :user
    has_many :pages, dependent: :destroy
    
    validates :user_id, presence: true
    validates :name, presence: true
    validates :is_private, inclusion: {in: [true, false]}
end
