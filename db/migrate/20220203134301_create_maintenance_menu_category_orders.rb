class CreateMaintenanceMenuCategoryOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :maintenance_menu_category_orders do |t|
      t.references :maintenance_menu, null: false, foreign_key: true, index: { name: :index_menu_category_orders_on_maintenance_menu_id }
      t.references :maintenance_category, null: false, foreign_key: true, index: { name: :index_menu_category_orders_on_maintenance_category }
      t.integer :order, null: false

      t.timestamps
    end
    add_index :maintenance_menu_category_orders, [:maintenance_menu_id, :maintenance_category_id], unique: true, name: :index_maintenance_menu_category_orders
  end
end
