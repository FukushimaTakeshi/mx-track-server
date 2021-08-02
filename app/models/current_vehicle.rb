# == Schema Information
#
# Table name: current_vehicles
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  user_vehicle_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class CurrentVehicle < ApplicationRecord
  belongs_to :user
  belongs_to :user_vehicle
end
