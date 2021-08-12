class PeriodicMaintenancesController < ApplicationController
  before_action :authenticate_user

  def index
    @periodic_maintenances =
      PeriodicMaintenance.preload(:maintenance_menu).where(user_vehicle_id: params[:user_vehicle_id])
    render handlers: :jb
  end

  def show
    @periodic_maintenance = PeriodicMaintenance.find(params[:id])
    render handlers: :jb
  end

  def create
    periodic_maintenance = PeriodicMaintenance.new(periodic_maintenance_params)
    if periodic_maintenance.save
      head :created
    else
      render json: periodic_maintenance.errors.as_json, status: :unprocessable_entity
    end
  end

  def update
    periodic_maintenance = PeriodicMaintenance.find(params[:id])
    if periodic_maintenance.update(periodic_maintenance_params)
      head :ok
    else
      render json: periodic_maintenance.errors.as_json, status: :unprocessable_entity
    end
  end

  def destroy
    PeriodicMaintenance.find(params[:id]).destroy
  end

  private

  def periodic_maintenance_params
    params.require(:periodic_maintenance).permit(
      :maintenance_menu_id,
      :cycle_hours,
      :cycle_minutes,
      :memo,
      :user_vehicle_id
    )
  end
end
