class MaintenanceRecordsController < ApplicationController
  before_action :authenticate_user

  def index
    @maintenance_records = MaintenanceRecord.where(user_vehicle_id: params[:user_vehicle_id]).sorted(params[:sort])
    render handlers: :jb
  end

  def show
    @maintenance_record = MaintenanceRecord.find(params[:id])
    render handlers: :jb
  end

  def create
    maintenance_record = MaintenanceRecord.new(maintenance_records_params)
    if maintenance_record.save
      head :created
    else
      render json: maintenance_record.errors.as_json, status: :unprocessable_entity
    end
  end

  def update
    maintenance_record = MaintenanceRecord.find(params[:id])
    if maintenance_record.update(maintenance_records_params)
      head :created
    else
      render json: maintenance_record.errors.as_json, status: :unprocessable_entity
    end
  end

  def destroy
    MaintenanceRecord.find(params[:id]).destroy
  end

  private

  def maintenance_records_params
    params.require(:maintenance_record).permit(
      :maintenance_on,
      :operation_hours,
      :operation_minutes,
      :memo,
      :maintenance_menu_id,
      :user_vehicle_id
    )
  end
end
