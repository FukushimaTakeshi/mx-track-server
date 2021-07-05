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
class Prefecture < ApplicationRecord
  belongs_to :region
  has_many :off_road_tracks
end
