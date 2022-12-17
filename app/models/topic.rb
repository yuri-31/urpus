class Topic < ApplicationRecord
    
    belongs_to :admin
    has_many :columns, dependent: :destroy
end
