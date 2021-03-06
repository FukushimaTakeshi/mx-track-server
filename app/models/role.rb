# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#
class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles
  has_many :role_permissions
  has_many :permissions, through: :role_permissions

  validates :name, presence: true
end
