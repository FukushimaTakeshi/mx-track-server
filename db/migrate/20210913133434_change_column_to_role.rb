class ChangeColumnToRole < ActiveRecord::Migration[6.1]
  def change
    change_column_null :roles, :type, false
    change_column_default :roles, :type, from: nil, to: 0
  end
end
