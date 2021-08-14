class OperationTimesController < ApplicationController
  def show
    initial_time = UserVehicle.find(params[:user_vehicle_id]).initial_time
    time = PracticeRecord
           .where(user_vehicle_id: params[:user_vehicle_id])
           .date_less_than_or_equal_to(params[:date])
           .sum(:practice_time) + initial_time

    render json: { hours: time / 60, minutes: time % 60 }
  end
end
