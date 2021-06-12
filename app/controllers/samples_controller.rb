class SamplesController < ApplicationController
  def index
    render json: { hoge: 'fuga' }
  end
end