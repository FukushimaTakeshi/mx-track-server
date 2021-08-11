class CreateMaintenances < ActiveRecord::Migration[6.1]
  def change
    create_table :maintenances do |t|
      t.string :name, null: false
      t.integer :cycle_time, null: false, default: 0
      t.text :memo, null: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
