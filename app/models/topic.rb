class Topic < ApplicationRecord
    
    belongs_to :admin
    has_many :columns, dependent: :destroy
    
    validates :admin_id, presence: true
    validates :name, presence: true
end
