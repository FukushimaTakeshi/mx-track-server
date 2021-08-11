class ChangeColumnToMaintenance < ActiveRecord::Migration[6.1]
  def change
    rename_column :maintenances, :user_vehicles_id, :user_vehicle_id
  end
end
