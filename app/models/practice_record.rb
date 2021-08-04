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
  belongs_to :off_road_track
  belongs_to :user_vehicle

  attribute :hours, :integer
  attribute :minutes, :integer

  validates :practice_date, presence: true
  validates :hours, numericality: { only_integer: true, less_than: 24, allow_blank: true }
  validates :minutes, numericality: { only_integer: true, less_than: 60, allow_blank: true }
  validates :off_road_track, presence: true
  validates :user_vehicle, presence: true

  after_validation :set_practice_time

  SORT_PARAMS = {
    ' ': 'ASC',
    '-': 'DESC'
  }.freeze

  scope :sorted, lambda { |sort_param|
    return if sort_param.nil?
    return unless sort_param.start_with?(*SORT_PARAMS.keys.map(&:to_s))

    sort_key = sort_param[1..]
    return unless attribute_names.include?(sort_key)

    order("#{sort_key}": SORT_PARAMS[:"#{sort_param[0]}"])
  }

  private

  def set_practice_time
    self.practice_time = (hours || 0) * 60 + (minutes || 0) if hours || minutes
  end
end
