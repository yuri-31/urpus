class CreateColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :columns do |t|
      t.integer :topic_id, null: false, foreign_key: true
      t.string :title, null: false
      t.text :article, null: false
      t.string :writer, null: false
      t.boolean :is_public, null: false, default: true
      t.timestamps
    end
  end
end
