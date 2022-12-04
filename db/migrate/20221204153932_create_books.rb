class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :name, null: false
      t.boolean :is_private, null: false, default: false
      t.timestamps
    end
  end
end
