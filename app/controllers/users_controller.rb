class UsersController < ApplicationController
  def create
    raise ArgumentError, 'BadRequest Parameter' if payload.blank?

    user = User.find_or_initialize_by(uid: payload['sub'])
    user.attributes = user_params
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
    # sleep(2)
    @payload ||= FirebaseIdToken::Signature.verify token
  end

  def user_params
    params.require(:user).permit(:name, :email, :photo_url)
  end
end
