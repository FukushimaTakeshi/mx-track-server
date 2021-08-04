class PracticeRecordsController < ApplicationController
  before_action :authenticate_user

  def index
    @practice_records = PracticeRecord
                        .preload(:off_road_track, { user_vehicle: { vehicle: :model } })
                        .where(user_id: current_user.id)
                        .sorted(params[:sort])
    if params[:field] == 'number_of_monthly'
      @current_date = Date.current
      render 'practice_records/number_of_monthly', handlers: :jb
    else
      render handlers: :jb
    end
  end

  def show
    @practice_record = PracticeRecord.preload(:off_road_track).find(params[:id])
    render handlers: :jb
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
    @practice_record = PracticeRecord.find(params[:id])
    if @practice_record.update(practice_record_params)
      render handlers: :jb
    else
      render json: @practice_record.errors.as_json
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
      :memo,
      :user_vehicle_id
    ).merge(user_id: current_user.id)
  end
end
