class ChangeColumnToRole2 < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :name, :string
    remove_column :roles, :type, :integer
  end
end
