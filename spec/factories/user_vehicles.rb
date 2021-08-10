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
FactoryBot.define do
  factory :user_vehicle do
    user { nil }
    vehicle { nil }
  end
end
