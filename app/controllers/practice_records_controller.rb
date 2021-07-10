class PracticeRecordsController < ApplicationController
  before_action :authenticate_user

  def index
    practice_records = PracticeRecord.where(user_id: current_user.id)
    render json: practice_records
  end

  def show
    practice_record = PracticeRecord.preload(:off_road_track).find(params[:id])
    render json: {
      id: practice_record.id,
      practice_date: practice_record.practice_date,
      track: { id: practice_record.off_road_track.id, name: practice_record.off_road_track.name },
      hours: practice_record.hours,
      minutes: practice_record.minutes,
      memo: practice_record.memo
    }
  end

  def create
    practice_record = PracticeRecord.new(practice_record_params)
    if practice_record.save
      head :created
    else
      render json: practice_record.errors.as_json
    end
  end

  def update
    practice_record = PracticeRecord.find(params[:id])
    if practice_record.update(practice_record_params)
      render json: practice_record
    else
      render json: practice_record.errors.as_json
    end
  end

  def destroy
    PracticeRecord.find(params[:id]).destroy
  end

  private

  def practice_record_params
    params.require(:practice_record).permit(
      :practice_date,
      :off_road_track_id,
      :hours,
      :minutes,
      :memo
    ).merge(user_id: current_user.id)
  end
end
