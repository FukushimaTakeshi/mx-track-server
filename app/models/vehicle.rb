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
class Vehicle < ApplicationRecord
  belongs_to :model
  has_many :user_vehicles
end
