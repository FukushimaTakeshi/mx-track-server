class CreateMaintenanceRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :maintenance_records do |t|
      t.date :maintenance_on, null: false
      t.integer :operation_time, null: false
      t.text :memo
      t.references :maintenance_menu, null: false, foreign_key: true
      t.references :user_vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
