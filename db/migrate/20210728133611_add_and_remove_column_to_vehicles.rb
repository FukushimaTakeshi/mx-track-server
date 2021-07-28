class AddAndRemoveColumnToVehicles < ActiveRecord::Migration[6.1]
  def change
    remove_index :vehicles, [:name, :year, :brand_id]
    remove_column :vehicles, :name, :string
    remove_foreign_key :vehicles, :brands
    remove_reference :vehicles, :brand, index: true
    add_reference :vehicles, :model, null: false, foreign_key: true
  end
end
