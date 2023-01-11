# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'admin@example',
    password: 'adminadmin'
    )
    
User.create!(
    [
        {nickname: 'Mike', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg"), 
        login_id: 'mikedesu', note: 'My name is Mike.', email: 'michael@test.com', password: 'password', is_deleted: false},
        {nickname: 'Shelly', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg"),
        login_id: 'shellydayo', note: 'Hello there.', email: 'shelly@test.com', password: 'password', is_deleted: false},
        {nickname: 'Louis', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg"),
        login_id: 'louisitis', note: '', email: 'louis@test.com', password: 'password', is_deleted: false},
        {nickname: 'Yuri', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg"), 
        login_id: 'iamyuri', note: 'I am very excited!', email: 'yuri@test.com', password: 'password', is_deleted: false}
    ]
)

Book.create!(
    [
        {user_id: 1, name: 'Netflix', is_private: false},
        {user_id: 1, name: 'Podcast episodes', is_private: false},
        {user_id: 1, name: 'IELTS textbook', is_private: false},
        {user_id: 1, name: 'Online Lessons', is_private: false},
        {user_id: 1, name: 'English for customer service', is_private: true},
        {user_id: 2, name: 'Slangs in Canada', is_private: false},
        {user_id: 2, name: 'Speaking classes', is_private: false},
        {user_id: 2, name: 'Talks with family', is_private: false},
        {user_id: 3, name: 'One Direction albums', is_private: false},
        {user_id: 3, name: 'Youtube channels', is_private: false},
        {user_id: 4, name: 'F・R・I・E・N・D・S episodes',is_private: false}
    ]
)

Page.create!(
    [
        {book_id: 1, name: 'Stranger Things'},
        {book_id: 1, name: 'Breaking Bad'},
        {book_id: 1, name: 'Walking Dead'},
        {book_id: 1, name: 'F・R・I・E・N・D・S'},
        {book_id: 1, name: 'Harry Potter'},
        {book_id: 1, name: 'The Blacklists'},
        {book_id: 1, name: 'Money Heist'},
        {book_id: 2, name: 'AEE 1898: Nobody Doesn’t Like All Ears English'},
        {book_id: 2, name: 'AEE 1895: Are You Quiet Quitting?'},
        {book_id: 2, name: 'AEE 1878: How to Chat About Getting Away in English'},
        {book_id: 2, name: 'AEE 1861: 3 English Phrasal Verbs with Come'},
        {book_id: 2, name: 'AEE 1851: How to Talk About Your Pre-trip Rituals in English'},
        {book_id: 3, name: 'Chapter1 page0-21'},
        {book_id: 3, name: 'Chapter2 page22-34'},
        {book_id: 3, name: 'Chapter3 page35-48'},
        {book_id: 3, name: 'Chapter4 page49-55'},
        {book_id: 3, name: 'Chapter5 page56-67'},
        {book_id: 4, name: '1.Friends and family'},
        {book_id: 4, name: '2.Your childhood'},
        {book_id: 4, name: '3.Your personality'},
        {book_id: 4, name: '4.Your hometown'},
        {book_id: 4, name: '5.Travel'},
        {book_id: 4, name: '6.Your neighborhood'},
        {book_id: 5, name: 'Restaurants'},
        {book_id: 5, name: 'Cafes'},
        {book_id: 5, name: 'Stores'},
        {book_id: 5, name: 'Hotels'},
        {book_id: 5, name: 'Travel'},
        {book_id: 7, name: 'September 5th'},
        {book_id: 7, name: 'September 8th'},
        {book_id: 7, name: 'September 13th'},
        {book_id: 9, name: 'Take Me Home'},
        {book_id: 9, name: 'Midnight Memories'},
        {book_id: 9, name: 'Made in the A.M.'},
        {book_id: 10, name: '"The One With Mrs. Bing"'},
        {book_id: 10, name: '"The One Where Ross Hugs Rachel"'},
    ]
)

Word.create!(
    [
        {user_id: 1, page_id: 4, name: 'pivot', form: 'verb', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'here and there', form: 'phrase', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'piggyback ride', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'chica', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'annulment', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'commission', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'thingy', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'dashing', form: 'adjective', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'tepid water', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'wite-out', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'ob-gyn', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'outing', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'abseil', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'squiggly', form: 'adjective', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'fork it over', form: 'phrase', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'pay the piper', form: 'phrase', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'prison lingo', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 4, name: 'the other way round', form: 'idiom', is_learnt: false},
        {user_id: 1, page_id: 6, name: 'infamous', form: 'adjective', is_learnt: false},
        {user_id: 1, page_id: 6, name: 'money pit', form: 'noun', is_learnt: false},
        {user_id: 1, page_id: 6, name: 'schmancy', form: 'adjective', is_learnt: false},
        {user_id: 1, page_id: 6, name: 'smitten', form: 'adjective', is_learnt: false},
        {user_id: 1, page_id: 6, name: 'informant', form: 'noun', is_learnt: false}
    ]
)

Meaning.create!(
    [
        {word_id: 1, content: 'to turn or twist'},
        {word_id: 2, content: 'in various places'},
        {word_id: 4, content: 'a girl or young woman'},
        {word_id: 5, content: 'the act of annulling, especially the formal declaration that annuls a marriage.'},
        {word_id: 6, content: 'a payment to someone who sells goods that is directly related to the amount sold, or a system that uses such payments'},
        {word_id: 7, content: 'a person or thing whose name one has forgotten, does not know, or does not wish to mention'},
        {word_id: 8, content: 'attractive, adventurous and full of confidence(typically used of a man)'},
        {word_id: 9, content: 'lukewarm water. water that is tepid is slightly warm.'},
        {word_id: 10, content: 'a registered trademark for a brand of correction fluid'},
        {word_id: 11, content: 'a doctor who specialized in womens health.'},
        {word_id: 12, content: 'a trip taken for pleasure, especially one lasting a day or less'},
        {word_id: 13, content: 'a descent made by abseiling'},
        {word_id: 14, content: 'consisting of a line or lines that curve and twist in a way that is not regular'},
        {word_id: 15, content: 'to give something, especially money to someone, especially when you do not want to'},
        {word_id: 16, content: 'to pay the consequences for self-indulgent behavior'},
        {word_id: 17, content: 'an argot used primarily by criminals and detainees in correctional institutions'}
    ]
)

Example.create!(
    [
        {word_id: 1, sentence: 'He pivoted on his heels and headed out.'},
        {word_id: 2, sentence: 'Clothes were scattered here and there.'},
        {word_id: 3, sentence: 'Can I have a piggyback ride?'},
        {word_id: 4, sentence: 'Us chicas got to stick together.'},
        {word_id: 5, sentence: 'I did not get the annulment, so we re still married.'},
        {word_id: 6, sentence: 'She gets a 15 percent commission on every machine she sells.'},
        {word_id: 6, sentence: 'Is she paid a regular wage or is it on commission only?'},
        {word_id: 7, sentence: 'I am attending a family thingy this weekend.'},
        {word_id: 8, sentence: 'a dashing young pilot'},
        {word_id: 12, sentence: 'One evening, she made a rare outing to the local discotheque.'},
        {word_id: 14, sentence: 'He drew three squiggly lines.'},
        {word_id: 15, sentence: 'We had to fork over ten bucks to park near the stadium.'},
        {word_id: 15, sentence: 'Hey, that is mine. Fork it over!'},
        {word_id: 16, sentence: 'If you stay up late at night to watch TV, in the morning you will have to pay the piper.'}
    ]
)

Topic.create!(
    [
        {admin_id: 1, name: 'GRAMMAR'},
        {admin_id: 1, name: 'TRAVEL'},
        {admin_id: 1, name: 'IDIOM'},
        {admin_id: 1, name: 'SLANG'},
        {admin_id: 1, name: 'CULTURES'},
        {admin_id: 1, name: 'ENGLISH EXAMS'},
        {admin_id: 1, name: 'OTHERS'}
    ]
)

Column.create!(
    [
        {topic_id: 7, title: 'Hello, world!',
        article: 'Hello everyone. Welcome on URPUS. 
                  It is our pleasure to be a partner of yours to expand your voocabulary knowledge. 
                  On this TIMELINE page, where we are going to be releasing columns every week, 
                  you will be expecting to learn some new ideas or knowledge about a lot of different topics.
                  We hope you enjoy creating your own vocabulary database here and sharing it with us!',
        writer: 'Yuri', is_public: true}
    ]
)