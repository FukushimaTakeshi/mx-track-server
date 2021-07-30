class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    render handlers: :jb
  end

  def show
    @brand = Brand.find(params[:id])
    render handlers: :jb
  end
end
