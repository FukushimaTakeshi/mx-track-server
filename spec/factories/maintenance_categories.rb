# == Schema Information
#
# Table name: maintenance_categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :maintenance_category do
    name { "MyString" }
  end
end
