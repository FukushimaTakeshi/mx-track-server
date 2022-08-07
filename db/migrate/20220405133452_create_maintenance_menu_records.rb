class CreateMaintenanceMenuRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :maintenance_menu_records do |t|
      t.references :maintenance_record, null: false, foreign_key: true
      t.references :maintenance_menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
