class ModelsController < ApplicationController
  def index
    models = Model.where(brand_id: params[:brand_id])
    render json: models.map do |model|
      {
        id: model.id,
        name: model.name
      }
    end
  end
end
