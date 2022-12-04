class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.integer :book_id, null: false, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
