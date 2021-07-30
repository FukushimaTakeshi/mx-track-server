# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#  photo_url  :string
#
class User < ApplicationRecord
  has_many :user_vehicles
end
