class ChangeColumnPracticeRecord < ActiveRecord::Migration[6.1]
  def change
    change_column_null :practice_records, :off_road_track_id, false
  end
end
