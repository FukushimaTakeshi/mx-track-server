class MaintenanceMenusController < ApplicationController
  def index
    @maintenance_menus = MaintenanceMenu
                         .eager_load(:maintenance_category, :maintenance_menu_category_order)
                         .order('maintenance_menu_category_orders.order asc')
                         .group_by { |menu| menu.maintenance_category&.id }
    render handlers: :jb
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
    params.require(:maintenance_menu).permit(:name, :maintenance_category_id)
  end
end
