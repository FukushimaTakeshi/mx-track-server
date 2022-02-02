class AddMaintenanceCategoryToMaintenanceMenu < ActiveRecord::Migration[6.1]
  def change
    add_reference :maintenance_menus, :maintenance_category, foreign_key: true
  end
end
