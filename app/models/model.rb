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
class Model < ApplicationRecord
  belongs_to :brand
  has_many :vehicles

  validates :name, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :brand, presence: true
end
