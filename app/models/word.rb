class Word < ApplicationRecord
    
    belongs_to :page
    has_many :meanings
    has_many :examples
    
    enum form: {verb: 0, noun: 1, adjective: 2, adverb: 3, phrase: 4, idiom: 5}
end
