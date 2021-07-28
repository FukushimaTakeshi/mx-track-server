class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    render handlers: :jb
  end
end
