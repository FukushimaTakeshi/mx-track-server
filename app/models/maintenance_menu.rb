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
class MaintenanceMenu < ApplicationRecord
  has_many :periodic_maintenances
  has_many :maintenance_records
  belongs_to :maintenance_category
  has_one :maintenance_menu_category_order
end
