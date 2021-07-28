# == Schema Information
#
# Table name: models
#
#  id         :bigint           not null, primary key
#  name       :string
#  brand_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Model, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
