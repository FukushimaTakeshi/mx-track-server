class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, unique: true
    add_column :users, :photo_url, :string, null: true
  end
end
