# == Schema Information
#
# Table name: maintenance_menus
#
#  id                      :bigint           not null, primary key
#  name                    :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  maintenance_category_id :bigint
#
FactoryBot.define do
  factory :maintenance_menu do
    name { "MyString" }
  end
end
