class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :name, null: false
      t.integer :year, null: false
      t.references :brand, index: true, foreign_key: true, null: false

      t.timestamps
    end

    add_index :vehicles, [:name, :year, :brand_id], unique: true
  end
end
