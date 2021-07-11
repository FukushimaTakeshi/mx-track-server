class OffRoadTracksController < ApplicationController
  def index
    @off_road_tracks = OffRoadTrack.where(prefecture_id: params[:prefecture_id])
    render handlers: :jb
  end

  def show
    render json: OffRoadTrack.find(params[:id])
  end

  def create
    off_road_track = OffRoadTrack.new(off_road_track_params)
    if off_road_track.save
      head :created
    else
      render json: off_road_track.errors.as_json
    end
  end

  def update
    off_road_track = OffRoadTrack.find(params[:id])
    if off_road_track.update(off_road_track_params)
      render json: off_road_track
    else
      render json: off_road_track.errors.as_json
    end
  end

  def destroy
    OffRoadTrack.find(params[:id]).destroy
  end

  private

  def off_road_track_params
    params.require(:off_road_track).permit(:name)
  end
end
