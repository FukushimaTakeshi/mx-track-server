class MaintenancesController < ApplicationController
  before_action :authenticate_user

  def index
    @maintenances = Maintenance.where(user_vehicle_id: params[:user_vehicle_id])
    render handlers: :jb
  end

  def show
    @maintenance = Maintenance.find(params[:id])
    render handlers: :jb
  end

  def create
    maintenance = Maintenance.new(maintenance_params)
    if maintenance.save
      head :created
    else
      render json: maintenance.errors.as_json, status: :unprocessable_entity
    end
  end

  def update
    maintenance = Maintenance.find(params[:id])
    if maintenance.update(maintenance_params)
      head :ok
    else
      render json: maintenance.errors.as_json, status: :unprocessable_entity
    end
  end

  def destroy
    Maintenance.find(params[:id]).destroy
  end

  private

  def maintenance_params
    params.require(:maintenance).permit(
      :name,
      :cycle_hours,
      :cycle_minutes,
      :memo,
      :user_vehicle_id
    )
  end
end
