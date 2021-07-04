class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|
      t.integer :code, null: false
      t.string :name, null: false
      t.references :region, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
