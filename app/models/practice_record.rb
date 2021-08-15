# == Schema Information
#
# Table name: practice_records
#
#  id                :bigint           not null, primary key
#  practice_date     :date             not null
#  memo              :text
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  off_road_track_id :bigint           not null
#  practice_time     :integer          default(0), not null
#  user_vehicle_id   :bigint
#
class PracticeRecord < ApplicationRecord
  include Sortable

  belongs_to :off_road_track
  belongs_to :user_vehicle

  attribute :hours, :integer
  attribute :minutes, :integer

  validates :practice_date, presence: true
  validates :hours, numericality: { only_integer: true, less_than_or_equal_to: 23, allow_blank: true }
  validates :minutes, numericality: { only_integer: true, less_than_or_equal_to: 59, allow_blank: true }
  validates :off_road_track, presence: true
  validates :user_vehicle, presence: true

  after_validation :set_practice_time

  scope :date_less_than_or_equal_to, ->(date) { where(practice_date: ..date || Date.current) }
  scope :greater_than_or_equal_to, ->(date) { where(practice_date: date || Date.current..) }

  class << self
    def total_time_from_last(date)
      records = date ? greater_than_or_equal_to(date) : date_less_than_or_equal_to(nil)
      records.sum(:practice_time)
    end
  end

  private

  def set_practice_time
    self.practice_time = (hours || 0) * 60 + (minutes || 0) if hours || minutes
  end
end
