class AddColumnToPeriodicMaintenance < ActiveRecord::Migration[6.1]
  def change
    add_reference :periodic_maintenances, :maintenance_menu, null: true, foreign_key: true
    remove_column :periodic_maintenances, :name, :string, null: false
  end
end
