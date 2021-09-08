class MaintenanceMenusController < ApplicationController
  def index
    render json: MaintenanceMenu.all.map { |menu| { id: menu.id, name: menu.name } }
  end

  def create
    maintenance_menu = MaintenanceMenu.new(maintenance_menu_params)
    if maintenance_menu.save
      head :created
    else
      render json: maintenance_menu.errors.as_json, status: :unprocessable_entity
    end
  end

  def update
    maintenance_menu = MaintenanceMenu.find(params[:id])
    if maintenance_menu.update(maintenance_menu_params)
      head :created
    else
      render json: maintenance_menu.errors.as_json, status: :unprocessable_entity
    end
  end

  def destroy
    MaintenanceMenu.find(params[:id]).destroy
  end

  private

  def maintenance_menu_params
    params.require(:maintenance_menu).permit(:name)
  end
end
