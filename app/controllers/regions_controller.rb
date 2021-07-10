class RegionsController < ApplicationController
  def index
    sleep(1)
    render json: Region.all
  end

  def show
    # TODO: JSON Serializer
    region = Region.preload(:prefectures).find(params[:id])
    render json: {
      id: region.id,
      name: region.name,
      prefectures: region.prefectures.map { |p| { id: p.id, name: p.name } }
    }
  end
end
