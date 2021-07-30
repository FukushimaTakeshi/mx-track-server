class UserVehiclesController < ApplicationController
  before_action :authenticate_user

  def index
    render UserVehicle.where(user_id: current_user.id)
  end

  def create
    user_vehicle = UserVehicle.new(**user_vehicle_params, user: current_user)
    if user_vehicle.save
      head :created
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
