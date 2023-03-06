class Word < ApplicationRecord
    
    belongs_to :user
    belongs_to :page
    has_many :meanings, dependent: :destroy
    has_many :examples, dependent: :destroy
    
    validates :page_id, presence: true
    validates :name, presence: true, format: {with: /\A[a-zA-Z\s!-"&'~*,.?]+\z/ }
    validates :is_learnt, inclusion: {in: [true, false]}
    validates :user_id, presence: true
    
    
    accepts_nested_attributes_for :meanings, allow_destroy: true, reject_if: :all_blank
    accepts_nested_attributes_for :examples, allow_destroy: true, reject_if: :all_blank
    
    enum form: {verb: 0, noun: 1, adjective: 2, adverb: 3, phrase: 4, idiom: 5}
end
