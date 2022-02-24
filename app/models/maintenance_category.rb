# == Schema Information
#
# Table name: maintenance_categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MaintenanceCategory < ApplicationRecord
  has_many :maintenance_menus
  has_one :maintenance_menu_category_order
end
