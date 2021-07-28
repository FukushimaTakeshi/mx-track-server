# == Schema Information
#
# Table name: off_road_tracks
#
#  id            :bigint           not null, primary key
#  name          :string
#  prefecture_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :off_road_track do
    name { 'テストサーキット' }
  end
end
