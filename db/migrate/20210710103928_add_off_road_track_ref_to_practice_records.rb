class AddOffRoadTrackRefToPracticeRecords < ActiveRecord::Migration[6.1]
  def change
    add_reference :practice_records, :off_road_track, null: true, foreign_key: true
  end
end
