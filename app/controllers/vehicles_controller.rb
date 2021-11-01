class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle
                .eager_load(:model)
                .where(year: params[:year], model: { brand_id: params[:brand_id] })
                .order('model.name')
    render handlers: :jb
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    render handlers: :jb
  end

  def create
    form = VehicleRegistrationForm.new(vehicle_params)
    if form.save
      head :created
    else
      render json: form.errors.as_json, status: :unprocessable_entity
    end
  end

  private

  def vehicle_params
    params.permit(:year, brand: [:id], model: [:id, :name])
  end
end
