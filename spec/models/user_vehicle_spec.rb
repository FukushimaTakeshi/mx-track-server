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
require 'rails_helper'

RSpec.describe UserVehicle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
