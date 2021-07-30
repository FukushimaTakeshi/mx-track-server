class UserVehiclesController < ApplicationController
  before_action :authenticate_user

  def index
    @user_vehicles = UserVehicle.eager_load(vehicle: { model: :brand }).where(user_id: current_user.id)
    render handlers: :jb
  end

  def create
    user_vehicle = UserVehicle.new(**user_vehicle_params, user: current_user)
    if user_vehicle.save
      render json: { id: user_vehicle.id }
    else
      render json: user_vehicle.errors.as_json
    end
  end

  def destroy
    UserVehicle.find(params[:id]).destroy
  end

  private

  def user_vehicle_params
    params.require(:user_vehicle).permit(:vehicle_id)
  end
end
