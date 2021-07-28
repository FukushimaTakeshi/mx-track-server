# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  model_id   :bigint           not null
#
require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
