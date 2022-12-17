class Word < ApplicationRecord
    
    belongs_to :user
    belongs_to :page
    has_many :meanings, dependent: :destroy
    has_many :examples, dependent: :destroy
    
    enum form: {verb: 0, noun: 1, adjective: 2, adverb: 3, phrase: 4, idiom: 5}
end
