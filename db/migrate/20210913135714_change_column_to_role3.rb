class ChangeColumnToRole3 < ActiveRecord::Migration[6.1]
  def change
    change_column_null :roles, :name, false
  end
end
