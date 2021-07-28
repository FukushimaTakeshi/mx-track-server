# == Schema Information
#
# Table name: models
#
#  id         :bigint           not null, primary key
#  name       :string
#  brand_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :model do
    name { "MyString" }
    brand { nil }
  end
end
