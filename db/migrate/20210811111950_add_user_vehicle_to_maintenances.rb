class AddUserVehicleToMaintenances < ActiveRecord::Migration[6.1]
  def change
    add_reference :maintenances, :user_vehicles, null: false, foreign_key: true
    remove_reference :maintenances, :user, foreign_key: true
  end
end
