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
require 'rails_helper'

RSpec.describe MaintenanceMenuRecord, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
