class CreateExamples < ActiveRecord::Migration[6.1]
  def change
    create_table :examples do |t|
      t.integer :word_id, null: false, foreign_key: true
      t.string :sentence, null: false
      t.timestamps
    end
  end
end
