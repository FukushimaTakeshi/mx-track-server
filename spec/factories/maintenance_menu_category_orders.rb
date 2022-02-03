# == Schema Information
#
# Table name: maintenance_menu_category_orders
#
#  id                      :bigint           not null, primary key
#  maintenance_menu_id     :bigint           not null
#  maintenance_category_id :bigint           not null
#  order                   :integer          not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
FactoryBot.define do
  factory :maintenance_menu_category_order do
    maintenance_menu { "" }
  end
end
