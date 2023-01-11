class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :page_id, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :form
      t.boolean :is_learnt, null: false, default: false
      t.timestamps
    end
  end
end
