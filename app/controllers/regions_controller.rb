class RegionsController < ApplicationController
  def index
    @regions = Region.all
    render handlers: :jb
  end

  def show
    @region = Region.preload(:prefectures).find(params[:id])
    render handlers: :jb
  end
end
