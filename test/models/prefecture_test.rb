# == Schema Information
#
# Table name: prefectures
#
#  id         :bigint           not null, primary key
#  code       :integer          not null
#  name       :string           not null
#  region_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PrefectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
