class RemoveMaintenancMenuIdFromMaintenanceRecord < ActiveRecord::Migration[6.1]
  def change
    remove_column :maintenance_records, :maintenance_menu_id, :bigint
  end
end
