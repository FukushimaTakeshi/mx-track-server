# == Schema Information
#
# Table name: maintenances
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  cycle_time      :integer          default(0), not null
#  memo            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_vehicle_id :bigint           not null
#
require 'rails_helper'

RSpec.describe Maintenance, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
