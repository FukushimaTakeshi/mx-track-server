class MaintenanceCategoriesController < ApplicationController
  def index
    render json: MaintenanceCategory.all.map { |category| { id: category.id, name: category.name } }
  end

  def show
    maintenance_category = MaintenanceCategory.eager_load(:maintenance_menus).find(params[:id])
    json = {
      id: maintenance_category.id,
      name: maintenance_category.name,
      menus: maintenance_category.maintenance_menus.map do |menu|
        {
          id: menu.id,
          name: menu.name
        }
      end
    }
    render json: json
  end

  def create
    maintenance_category = MaintenanceCategory.new(maintenance_category_params)
    if maintenance_category.save
      head :created
    else
      render json: maintenance_category.errors.as_json, status: :unprocessable_entity
    end
  end

  def update
    maintenance_category = MaintenanceCategory.find(params[:id])
    if maintenance_category.update(maintenance_category_params)
      head :created
    else
      render json: maintenance_category.errors.as_json, status: :unprocessable_entity
    end
  end

  def destroy
    MaintenanceCategory.find(params[:id]).destroy
  end

  private

  def maintenance_category_params
    params.require(:maintenance_category).permit(:name)
  end
end
