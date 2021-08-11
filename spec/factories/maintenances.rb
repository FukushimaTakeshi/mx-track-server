# == Schema Information
#
# Table name: maintenances
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  cycle_time      :integer          default(0), not null
#  memo            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_vehicle_id :bigint           not null
#
FactoryBot.define do
  factory :maintenance do
    name { "MyString" }
    cycle_time { 1 }
    memo { "MyText" }
    user { nil }
  end
end
