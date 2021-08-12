class ChangeColumnsAddNotnullOnPeriodicMaintenance < ActiveRecord::Migration[6.1]
  def change
    change_column_null :periodic_maintenances, :maintenance_menu_id, false
  end
end
