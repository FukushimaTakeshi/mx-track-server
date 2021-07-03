class PracticeRecordsController < ApplicationController
  def index
    practice_records = PracticeRecord.where(user_id: current_user.id)
    render json: practice_records
  end

  def show
    render json: PracticeRecord.find(params[:id])
  end

  def create
    practice_record = PracticeRecord.new(practice_record_params)
    if practice_record.save
      head :created
    else
      render json: practice_record.errors.as_json
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def practice_record_params
    params.require(:practice_record).permit(
      :practice_date,
      :hours,
      :minutes,
      :memo
    ).merge(user_id: current_user.id)
  end
end
