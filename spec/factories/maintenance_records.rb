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
FactoryBot.define do
  factory :maintenance_record do
    maintenance_on { "2021-08-13" }
    operation_time { 1 }
    memo { "MyText" }
    maintenance_menu { nil }
    user_vehicle { nil }
  end
end
