class RolesController < ApplicationController
  before_action :authenticate_user

  def index
    user_roles = UserRole.preload(role: :permissions).where(user: current_user)
    names = user_roles.map { |user_role| user_role.role.permissions.map(&:name) }.flatten

    render json: names
  end
end
