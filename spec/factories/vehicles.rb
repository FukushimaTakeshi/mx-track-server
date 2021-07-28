# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  model_id   :bigint           not null
#
FactoryBot.define do
  factory :vehicle do
    name { "MyString" }
    year { 1 }
    brand { nil }
  end
end
