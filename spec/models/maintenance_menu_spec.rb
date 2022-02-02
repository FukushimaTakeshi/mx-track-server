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
require 'rails_helper'

RSpec.describe MaintenanceMenu, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
