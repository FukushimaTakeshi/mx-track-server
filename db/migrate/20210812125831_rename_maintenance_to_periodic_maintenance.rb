class RenameMaintenanceToPeriodicMaintenance < ActiveRecord::Migration[6.1]
  def change
    rename_table :maintenances, :periodic_maintenances
  end
end
