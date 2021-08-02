class CreateCurrentVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :current_vehicles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user_vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
