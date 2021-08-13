# == Schema Information
#
# Table name: user_vehicles
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  vehicle_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  initial_time :integer          default(0), not null
#
class UserVehicle < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  has_one :current_vehicle, dependent: :destroy
  has_many :practice_records, dependent: :destroy
  has_many :periodic_maintenances, dependent: :destroy
  has_many :maintenance_records, dependent: :destroy

  attribute :initial_hours, :integer
  attribute :initial_minutes, :integer

  validates :initial_hours, numericality: { only_integer: true, less_than_or_equal_to: 999, allow_blank: true }
  validates :initial_minutes, numericality: { only_integer: true, less_than_or_equal_to: 59, allow_blank: true }

  after_validation :set_initial_time

  private

  def set_initial_time
    self.initial_time = (initial_hours || 0) * 60 + (initial_minutes || 0) if initial_hours || initial_minutes
  end
end
