class AddAndRemoveColumnToPracticeRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :practice_records, :practice_time, :integer, default: 0, null: false

    remove_column :practice_records, :hours, :integer
    remove_column :practice_records, :minutes, :integer
  end
end
