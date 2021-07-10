# == Schema Information
#
# Table name: practice_records
#
#  id                :bigint           not null, primary key
#  practice_date     :date             not null
#  hours             :integer          default(0), not null
#  minutes           :integer          default(0), not null
#  memo              :text
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  off_road_track_id :bigint           not null
#
class PracticeRecord < ApplicationRecord
  belongs_to :off_road_track

  validates :practice_date, presence: true
  validates :hours, presence: true
  validates :minutes, presence: true
  validates :off_road_track, presence: true
end
