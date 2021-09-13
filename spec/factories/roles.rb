# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#
FactoryBot.define do
  factory :role do
    type { 1 }
  end
end
