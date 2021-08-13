# == Schema Information
#
# Table name: maintenance_records
#
#  id                  :bigint           not null, primary key
#  maintenance_on      :date             not null
#  operation_time      :integer          not null
#  memo                :text
#  maintenance_menu_id :bigint           not null
#  user_vehicle_id     :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'rails_helper'

RSpec.describe MaintenanceRecord, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
