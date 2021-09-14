# == Schema Information
#
# Table name: permissions
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Permission < ApplicationRecord
  has_many :role_permissions
  has_many :roles, through: :role_permissions

  validates :name, presence: true
end
