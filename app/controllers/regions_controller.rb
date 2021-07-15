class RegionsController < ApplicationController
  def index
    @regions = Region.all
    render handlers: :jb
  end

  def show
    @region = Region.preload(prefectures: :off_road_tracks).find(params[:id])
    render handlers: :jb
  end
end
