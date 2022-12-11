class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :words, :form, true
  end
  def down
    change_column_null :words, :form, false
  end
end
