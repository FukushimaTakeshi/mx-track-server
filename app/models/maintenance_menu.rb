# == Schema Information
#
# Table name: maintenance_menus
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MaintenanceMenu < ApplicationRecord
  has_many :periodic_maintenances
  has_many :maintenance_records
end
