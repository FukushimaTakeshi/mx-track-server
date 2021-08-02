class AddUserVehiclesToPracticeRecords < ActiveRecord::Migration[6.1]
  def change
    add_reference :practice_records, :user_vehicle, null: true, foreign_key: true
  end
end
