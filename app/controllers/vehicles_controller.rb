class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.eager_load(:model).where(year: params[:year], model: { brand_id: params[:brand_id] })
    render handlers: :jb
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    render handlers: :jb
  end
end
