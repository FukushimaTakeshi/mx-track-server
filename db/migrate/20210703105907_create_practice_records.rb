class CreatePracticeRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :practice_records do |t|
      t.date :practice_date, null: false
      t.integer :hours, null: false, default: 0
      t.integer :minutes, null: false, default: 0
      t.text :memo
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
