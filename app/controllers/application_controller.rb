class ApplicationController < ActionController::API
  include Firebase::Auth::Authenticable
  before_action :authenticate_user
end
