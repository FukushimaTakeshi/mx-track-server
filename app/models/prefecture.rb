class Prefecture < ApplicationRecord
  belongs_to :region
  has_many :off_road_tracks
end
