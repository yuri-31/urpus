class CreateMeanings < ActiveRecord::Migration[6.1]
  def change
    create_table :meanings do |t|
      t.integer :word_id, null: false, foreign_key: true
      t.string :content, null: false
      t.timestamps
    end
  end
end
