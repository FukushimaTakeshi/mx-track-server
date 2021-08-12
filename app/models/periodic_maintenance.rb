# == Schema Information
#
# Table name: periodic_maintenances
#
#  id                  :bigint           not null, primary key
#  cycle_time          :integer          default(0), not null
#  memo                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_vehicle_id     :bigint           not null
#  maintenance_menu_id :bigint           not null
#
class PeriodicMaintenance < ApplicationRecord
  belongs_to :user_vehicle
  belongs_to :maintenance_menu

  validates :cycle_time, presence: true
  validates :user_vehicle, presence: true

  attribute :cycle_hours, :integer
  attribute :cycle_minutes, :integer

  validates :cycle_hours, numericality: { only_integer: true, less_than_or_equal_to: 999, allow_blank: true }
  validates :cycle_minutes, numericality: { only_integer: true, less_than_or_equal_to: 59, allow_blank: true }

  after_validation :set_initial_time

  private

  def set_initial_time
    self.cycle_time = (cycle_hours || 0) * 60 + (cycle_minutes || 0) if cycle_hours || cycle_minutes
  end
end
