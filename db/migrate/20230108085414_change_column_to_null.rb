class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :words, :user_id, false
  end
end
