class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.integer :admin_id, null: false, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
