class CurrentVehiclesController < ApplicationController
  before_action :authenticate_user

  def index
    current_vehicle = CurrentVehicle.find_by!(user_id: current_user.id)
    user_vehicle = current_vehicle.user_vehicle
    # TODO: modelに移行する
    json = {
      id: current_vehicle.user_vehicle_id,
      vehicle: {
        name: "#{user_vehicle.vehicle.model.brand.name} #{user_vehicle.vehicle.model.name} #{user_vehicle.vehicle.year}"
      }
    }
    render json: json
  end

  def create
    CurrentVehicle.destroy_by(user_id: current_user.id)
    current_vehicle = CurrentVehicle.new(**current_vehicle_params, user: current_user)
    if current_vehicle.save
      head :created
    else
      render json: current_vehicle.errors.as_json, status: :unprocessable_entity
    end
  end

  private

  def current_vehicle_params
    params.require(:current_vehicle).permit(:user_vehicle_id)
  end
end
