class RegionsController < ApplicationController
  def index
    render json: Region.all
  end

  def show
    # TODO: JSON Serializer
    region = Region.preload(:prefectures).find(params[:id])
    render json: {
      id: region.id,
      name: region.name,
      prefectures: region.prefectures.map { |p| { code: p.code, name: p.name } }
    }
  end
end
