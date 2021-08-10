class AddColumnToUserVehicle < ActiveRecord::Migration[6.1]
  def change
    add_column :user_vehicles, :initial_time, :integer, default: 0, null: false
  end
end
