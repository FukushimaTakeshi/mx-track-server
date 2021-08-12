class MaintenanceMenusController < ApplicationController
  def index
    render json: MaintenanceMenu.all.map { |menu| { id: menu.id, name: menu.name } }
  end
end
