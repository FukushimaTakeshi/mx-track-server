class PrefecturesController < ApplicationController
  def index
    prefectures = Prefecture.all.map do |prefecture|
      {
        id: prefecture.id,
        name: prefecture.name
      }
    end
    render json: prefectures
  end
end
