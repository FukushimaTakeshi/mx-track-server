class UsersController < ApplicationController
  skip_before_action :authenticate_user

  def create
    raise ArgumentError, 'BadRequest Parameter' if payload.blank?

    user = User.find_or_initialize_by(uid: payload['sub'])
    user.save!
    render json: user, status: :ok
  end

  private

  def token_from_request_headers
    request.headers['Authorization']&.split&.last
  end

  def token
    params[:token] || token_from_request_headers
  end

  def payload
    @payload ||= FirebaseIdToken::Signature.verify token
  end
end
