# == Schema Information
#
# Table name: user_vehicles
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  vehicle_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserVehicle < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  has_one :current_vehicle, dependent: :destroy
  # TODO: user_vehicleを削除した場合に紐付く、practice_recordsを削除するか
  has_many :practice_records, dependent: :nullify
end
