# == Schema Information
#
# Table name: maintenance_menu_records
#
#  id                    :bigint           not null, primary key
#  maintenance_record_id :bigint           not null
#  maintenance_menu_id   :bigint           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class MaintenanceMenuRecord < ApplicationRecord
  belongs_to :maintenance_record
  belongs_to :maintenance_menu
end
