# == Schema Information
#
# Table name: maintenance_records
#
#  id                  :bigint           not null, primary key
#  maintenance_on      :date             not null
#  operation_time      :integer          not null
#  memo                :text
#  maintenance_menu_id :bigint           not null
#  user_vehicle_id     :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class MaintenanceRecord < ApplicationRecord
  include Sortable

  belongs_to :maintenance_menu
  belongs_to :user_vehicle
  has_many :maintenance_menu_records
  has_many :maintenance_menus, through: :maintenance_menu_records

  attribute :operation_hours, :integer
  attribute :operation_minutes, :integer

  validates :maintenance_on, presence: true
  validates :operation_hours, numericality: { only_integer: true, less_than_or_equal_to: 999, allow_blank: true }
  validates :operation_minutes, numericality: { only_integer: true, less_than_or_equal_to: 59, allow_blank: true }
  validates :maintenance_menus, presence: true
  validates :user_vehicle, presence: true

  after_validation :set_operation_time

  class << self
    def last_maintenance_dates_by(menu_ids)
      where(maintenance_menu_id: menu_ids).group(:maintenance_menu_id).maximum(:maintenance_on)
    end
  end

  private

  def set_operation_time
    self.operation_time = (operation_hours || 0) * 60 + (operation_minutes || 0) if operation_hours || operation_minutes
  end
end
