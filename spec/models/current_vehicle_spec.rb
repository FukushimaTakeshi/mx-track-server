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
require 'rails_helper'

RSpec.describe CurrentVehicle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
